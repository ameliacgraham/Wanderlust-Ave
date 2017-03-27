
from jinja2 import StrictUndefined
from flask import Flask, jsonify, render_template, redirect, request, flash, session
from model import connect_to_db, db, User, BucketList, PublicItem, PrivateItem, Journal
from flask_debugtoolbar import DebugToolbarExtension
from LatLon import LatLon

app = Flask(__name__)
app.secret_key = "ABC"
app.jinja_env.undefined = StrictUndefined

@app.route('/')
def display_homepage():
    """Homepage"""

    public_items = PublicItem.query.all()

    return render_template("homepage.html", public_items=public_items)

@app.route('/<public_item_id>')
def display_public_item_details(public_item_id):
    """Displays info about a public item."""

    item_info = PublicItem.query.get(public_item_id)

    return render_template('public-item.html', 
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

    session = {}
    flash("You have successfully logged out!")
    return redirect("/")


@app.route('/my-lists')
def display_bucket_lists():
    """Display users bucket lists."""

    username = session["username"]
    user_bucket_lists = BucketList.query.filter(BucketList.username==username).all()

    return render_template("user-lists.html", user_bucket_lists=user_bucket_lists)

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


# Id of list object
@app.route('/my-lists/<list_id>')
def display_bucket_list(list_id):
    """Displays a user's bucket list."""

    bucket_list = BucketList.query.filter(BucketList.list_id==list_id).one()
    b_list_id = list_id 

    return render_template("bucket_list.html", bucket_list=bucket_list,
                            b_list=b_list_id)

@app.route('/add-item-form', methods=['GET', 'POST'])
def display_add_item_form():
    """Displays bucket item form."""

    username = session["username"]

    lists = BucketList.query.filter(BucketList.username==username).all()

    return render_template("add-item-form.html", lists=lists)

@app.route('/add-item/process', methods=['POST'])
def process_add_bucket_item():
    """Checks if item already exists in a list, if not then adds it."""

    title = request.form.get('title')
    username = request.form.get('username')
    tour_link = request.form.get('tour-link')
    latitude = request.form.get('latitude')
    longitude = request.form.get('longitude')
    image = request.form.get('image')
    description = request.form.get('description')
    list_title = request.form.get('list')


    try:
        item = PublicItem.query.filter(PublicItem.title==title).one()
    except Exception, e:
        bucket_item = PublicItem(title=title,image=image,description=description,
                                  latitude=latitude, longitude=longitude)
        db.session.add(bucket_item)
        db.session.commit()
        public_id = bucket_item.public_item_id
        b_list = BucketList.query.filter(BucketList.title==list_title).one()
        b_list_id = b_list.list_id
        new_item = PrivateItem(public_item_id=public_id,list_id=b_list_id,
                           tour_link=tour_link)
        db.session.add(new_item)
        db.session.commit()
        flash("Your item has been added!")
        return redirect('/my-lists/<{}>'.format(list_id))


    public_id = item.public_item_id
    b_list = BucketList.query.filter(BucketList.title==list_title).one()
    b_list_id = b_list.list_id
    private_item = PrivateItem.query.filter(PrivateItem.public_item_id==public_id).first()

    if private_item:
        flash("You already have an item with that title!")
        return redirect('/my-lists')
    else:
        new_item = PrivateItem(public_item_id=public_id,list_id=b_list_id,
                               tour_link=tour_link)
        db.session.add(new_item)
        db.session.commit()
        flash("Your item has been added!")
        return redirect('/my-lists/<{}>'.format(b_list_id))




if __name__ == "__main__":

    app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = True
    app.debug = True
    app.jinja_env.auto_reload = app.debug  # make sure templates, etc. are not cached in debug mode

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)
    
    app.run(port=5000, host='0.0.0.0')