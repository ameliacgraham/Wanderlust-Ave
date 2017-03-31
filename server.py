
from jinja2 import StrictUndefined
from flask import Flask, jsonify, render_template, redirect, request, flash, session
from model import connect_to_db, db, User, BucketList, PublicItem, PrivateItem, Journal
from flask_debugtoolbar import DebugToolbarExtension
from datetime import datetime
import os
import requests
import json

app = Flask(__name__)
app.secret_key = "ABC"
app.jinja_env.undefined = StrictUndefined

gm_api_key = os.environ['GOOGLE_MAPS_API_KEY']
travel_payouts_api = os.environ['TRAVEL_PAYOUTS_API']

@app.route('/')
def display_homepage():
    """Homepage"""

    public_items = PublicItem.query.all()
    username = session.get("username")
    return render_template("homepage.html", public_items=public_items,
                           username=username)

@app.route('/public/<pub_item_id>')
def display_public_item_details(pub_item_id):
    """Displays info about a public item."""

    username = session.get("username")
    item_info = PublicItem.query.filter(PublicItem.public_item_id==pub_item_id).one()
    return render_template('public-item.html', 
                           item_info=item_info,
                           username=username)

@app.route('/<list_id>/<priv_item_id>')
def display_private_item_details(list_id, priv_item_id):
    """Displays info about a private item."""

    item_info = PrivateItem.query.filter(PrivateItem.priv_item_id==priv_item_id).one()
    return render_template('private-item.html', 
                           item_info=item_info)

@app.route('/search')
def process_search_form():
    """Processes a search form."""

    form_input = request.args.get('public-search')
    keywords = form_input.split()
    matched_items = []

    for word in keywords:
        items = PublicItem.query.filter(PublicItem.title.like("%{}%".format(word))).all()
        for item_object in items:
            matched_items.append(item_object)

    return render_template('search-results.html', matched_items=matched_items)

@app.route('/map')
def display_google_map():
    """Display markers on a map for all public items"""

    items = PublicItem.query.all()
    places = []

    for item in items:
        item_coordinates = [item.title, item.latitude,
                            item.longitude]
        places.append(item_coordinates)
    
    # change back to UTF-8
    for location in places:
        location[0] = str(location[0])

    return render_template("public-items-map.html",
                           gm_api_key=gm_api_key,
                           places=places)

@app.route('/flight-search')
def display_flight_form():

    return render_template("flight-search.html")

@app.route('/flight-results')
def display_flight_results():

    origin = request.args.get('origin')
    destination = request.args.get('destination')
    depart_date = request.args.get('depart-at')
    return_date = request.args.get('return-at')
    time = datetime.now()
    year = time.year

    url = ("http://api.travelpayouts.com/v1/prices/cheap?origin={}"
                "&depart_date={}-{}&currency=USD&token={}").format(origin,
                                                                   year,
                                                                   depart_date,
                                                                   travel_payouts_api)
    if destination:
        url += "&destination={}".format(destination)

    elif destination and return_date:
        url += "&destination={}&return_date={}-{}".format(destination, year, return_date)

    elif return_date:
        url += "&return_date={}-{}".format(year, return_date)

    r = requests.get(url)
    data = r.text
    flight_results = json.loads(data)

    flights = []
    for airport in flight_results['data']:
        number = str(flight_results['data'][airport].keys()[0])
        price = str(flight_results['data'][airport][number]['price'])
        return_at = str(flight_results['data'][airport][number]['return_at'])
        # TODO: Clean up variable names
        return_at = return_at.replace("T", " ").replace("Z", "")
        return_at = datetime.strptime(return_at, "%Y-%m-%d %H:%M:%S")
        return_at = return_at.strftime("%A, %B %d, %Y, %I:%M %p")
        departure_at = str(flight_results['data'][airport][number]['departure_at'])
        departure_at = departure_at.replace("T", " ").replace("Z", "")
        departure_at = datetime.strptime(departure_at, "%Y-%m-%d %H:%M:%S")
        departure_at = departure_at.strftime("%A, %B %d, %Y, %I:%M %p")
        airline = str(flight_results['data'][airport][number]['airline'])
        flight_number = str(flight_results['data'][airport][number]['flight_number'])

        flights.append([airport, price, return_at, departure_at, airline, flight_number])

    return render_template('flight-results.html', flights=flights)


@app.route('/register', methods=['GET','POST'])
def process_registation_form():
    """Display and process registration form"""

    if request.method == 'GET':
        return render_template('registration-form.html')

    email = request.form.get('email')
    username = request.form.get('username')
    first_name = request.form.get('first-name')
    last_name = request.form.get('last-name')
    password = request.form.get('password')
    username_query = User.query.filter(User.username==username).all()

    if username_query:
        flash("An account for {} already exists!".format(username))
        return redirect("/login")
    else:
        user = User(username=username, email=email, password=password, first_name=first_name,
                    last_name=last_name)
        db.session.add(user)
        db.session.commit()
    return redirect("/")

@app.route('/login', methods=['GET', 'POST'])
def process_login_info():
    """Checks if user email and password exist on same account, then logs in or redirects."""

    if request.method == "GET":
        return render_template("login.html")

    username = request.form.get("username")
    password = request.form.get("password")
    
    try:
        user_query = User.query.filter(User.username==username).one()
    except Exception, e:
        user_query = False

    if user_query and user_query.password == password:
        session["username"] = user_query.username
        flash("You have successfully logged in!")
        return redirect("/my-lists")
    else:
        flash("Email or Password is incorrect. Please try again!")
        return redirect("/login")

@app.route('/logout')
def log_user_out():
    """Logs a user out."""

    del session['username']
    public_items = PublicItem.query.all()
    flash("You have successfully logged out!")
    return redirect("/")

@app.route('/my-lists')
def display_bucket_lists():
    """Display users bucket lists."""

    username = session.get("username")
    user_bucket_lists = BucketList.query.filter(BucketList.username==username).all()

    if username:
        user = User.query.get(username)
        progress_results = user.get_progress()

        items = progress_results['total_items']
        checked_off_items = progress_results['checked_items']

        return render_template("user-lists.html", 
                            user_bucket_lists=user_bucket_lists,
                            items=items,
                            checked_off_items=checked_off_items)
    else:
        flash("You are not signed in")
        return redirect('/login')

@app.route('/my-lists/add-form')
def display_add_list_form():
    """Display form to add new bucket list."""

    return render_template("add-list.html")


@app.route('/my-lists/add', methods=['POST'])
def add_bucket_list():
    """Add new bucket list."""

    title = request.form.get('title')
    username = request.form.get('username')

    try:
        user_list = BucketList.query.filter(BucketList.username==username,
                                            BucketList.title==title).one()
    except Exception, e:
        title = request.form.get('title')
        username = request.form.get('username')
        new_list = BucketList(username=username, title=title)
        db.session.add(new_list)
        db.session.commit()
        flash("Your list has been created!")
        return redirect('/my-lists')

    flash("You already have a list named {}".format(title))
    return redirect('/my-lists/add')

@app.route('/delete-item', methods=['POST'])
def delete_priv_item():
    """Deletes an item from a user's bucket list."""

    del_item = request.form.get('delete-item')
    item_id = request.form.get('item-id')
    print del_item

    if del_item == 'delete':
        item = PrivateItem.query.filter(PrivateItem.priv_item_id==item_id).one()
        db.session.delete(item)
        db.session.commit()

    return redirect('/')


# Id of list object instead of title
@app.route('/my-lists/<list_id>')
def display_bucket_list(list_id):
    """Displays a user's bucket list."""

    bucket_list = BucketList.query.filter(BucketList.list_id==list_id).one()
    b_list_id = list_id

    places = []

    for item in bucket_list.priv_items:
        item_coordinates = [item.public_item.title, item.public_item.latitude,
                            item.public_item.longitude]
        places.append(item_coordinates)
    
    # change back to UTF-8
    for location in places:
        location[0] = str(location[0])

    all_list_items = PrivateItem.query.filter(PrivateItem.list_id==b_list_id).count()
    checked_off_items = PrivateItem.query.filter(PrivateItem.list_id==b_list_id, PrivateItem.checked_off==True).count()
    progress = str(checked_off_items) + "/" + str(all_list_items)

    return render_template("bucket-list.html", 
                           bucket_list=bucket_list,
                           b_list=b_list_id,
                           gm_api_key=gm_api_key,
                           places=places,
                           progress=progress)

@app.route('/add-item-form', methods=['GET', 'POST'])
def display_add_item_form():
    """Displays bucket item form."""

    username = session["username"]

    lists = BucketList.query.filter(BucketList.username==username).all()

    return render_template("add-item-form.html",
                           lists=lists,
                           gm_api_key=gm_api_key)

@app.route('/add-item/process', methods=['POST'])
def process_add_bucket_item():
    """Checks if item already exists in a list, if not then adds it."""

    title = request.form.get('title')
    username = request.form.get('username')
    tour_link = request.form.get('tour-link')
    image = request.form.get('image')
    description = request.form.get('description')
    list_title = request.form.get('list')
    latitude = request.form.get('latitude')
    longitude = request.form.get('longitude')
    print latitude
    print longitude

    # Query for the public item with the title as the input title
    item = PublicItem.query.filter(PublicItem.title.ilike(title)).first()
    user = User.query.filter(User.username==username).one()

    # if there is a public item with that title
    if item:

        # If the title of the object is the same, create a private item with that
        # public id.
        public_id = item.public_item_id
        b_list = BucketList.query.filter(BucketList.title==list_title).one()
        b_list_id = b_list.list_id
        # Check if a private item for that userexists with that title
        private_item = PrivateItem.query.filter(PrivateItem.public_item_id==public_id, 
                                                user.username==username).all()

        # If there is a private item with that title
        if private_item:
            flash("You already have an item with that title!")
            return redirect('/my-lists')
        else:
            create_private_item(public_id, b_list_id, tour_link)
    # If there is not a public item with that title, create a public and private item    
    else:
        bucket_item = PublicItem(title=title,image=image,description=description,
                                  latitude=latitude, longitude=longitude)
        db.session.add(bucket_item)
        db.session.commit()
        public_id = bucket_item.public_item_id
        b_list = BucketList.query.filter(BucketList.title==list_title).one()
        b_list_id = b_list.list_id
        return create_private_item(public_id, b_list_id, tour_link)


def create_private_item(public_id, list_id, tour_link):
    new_item = PrivateItem(public_item_id=public_id,list_id=list_id,
                           tour_link=tour_link)
    db.session.add(new_item)
    db.session.commit()
    flash("Your item has been added!")
    return redirect('/my-lists/{}'.format(list_id))


@app.route('/check-off-item', methods=['POST'])
def check_off_item():
    """Changes the status of the item as completed."""

    item_id = request.form.get("item-id")
    list_id = request.form.get("list-id")

    item = PrivateItem.query.filter(PrivateItem.priv_item_id==item_id).one()
    item.checked_off = True
    db.session.commit()

    return redirect('/{}/{}'.format(list_id,item_id))



if __name__ == "__main__":

    app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = True
    app.debug = True
    app.jinja_env.auto_reload = app.debug  # make sure templates, etc. are not cached in debug mode

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)
    
    app.run(port=5000, host='0.0.0.0')