
from jinja2 import StrictUndefined
from flask import Flask, jsonify, render_template, redirect, request, flash, session, url_for, send_from_directory
from model import connect_to_db, db, User, BucketList, PublicItem, PrivateItem, Journal, Friend, Airline, Airport, City, Country
from werkzeug.utils import secure_filename
from flask_debugtoolbar import DebugToolbarExtension
from datetime import datetime, date
from StringIO import StringIO
import boto3
import facebook
import os
import requests
import json
from bcrypt import hashpw, gensalt
import operator


app = Flask(__name__)
app.secret_key = "BANNSALKSIAJAKL"
app.jinja_env.undefined = StrictUndefined
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024

ALLOWED_EXTENSIONS = set(['pdf', 'png', 'jpg', 'jpeg', 'gif'])

gm_api_key = os.environ['GOOGLE_MAPS_API_KEY']
travel_payouts_api = os.environ['TRAVEL_PAYOUTS_API']
AWS_KEY_ID = os.environ['AWS_ACCESS_KEY_ID']
AWS_SECRET_KEY = os.environ['AWS_SECRET_ACCESS_KEY']

@app.route('/')
def display_homepage():
    """Homepage"""

    public_items = PublicItem.query.all()
    countries = Country.query.all()
    country_names = []
    for country in countries:
        country_names.append(country.name)

    sorted_countries = sorted(country_names)
    email = session.get("email")
    lists = BucketList.query.filter(BucketList.email==email).all()
    
    user = None
    friends = None
    progress_results = None
    items = None
    checked_off_items = None

    if email:
        user = User.query.get(email)
        # list of user objects for friends
        friends = user.followers
        lists = BucketList.query.filter(BucketList.email==email).all()
        progress_results = user.get_progress()

        items = progress_results['total_items']
        checked_off_items = progress_results['checked_items']

    return render_template("homepage.html",
                            email=email) 
                           # public_items=public_items,
                           # lists=lists,
                           # email=email,
                           # country_names=sorted_countries,
                           # friends=friends,
                           # checked_off_items=checked_off_items,
                           # items=items)

@app.route('/register', methods=['POST'])
def process_registation_form():
    """Display and process registration form"""

    username = request.form.get('username')
    email = request.form.get('email')
    first_name = request.form.get('first-name')
    last_name = request.form.get('last-name')
    password = str(request.form.get('password'))
    # Hash a password for the first time, with a randomly-generated salt
    hashed = hashpw(password, gensalt())
    # hashed_pw = bcrypt.hashpw(password.encode("UTF_8"),bcrypt.gensalt())
    email_query = User.query.filter(User.email==email).all()

    if email_query:
        flash("An account for {} already exists!".format(email))
        return redirect("/")
    else:
        user = User(email=email, password=hashed, first_name=first_name,
                    last_name=last_name, username=username)
        db.session.add(user)
        db.session.commit()
    return redirect("/")

@app.route('/login', methods=['POST'])
def process_login_info():
    """Checks if user email and password exist on same account, then logs in or redirects."""

    email = request.form.get("email")
    print email
    password = str(request.form.get("password"))
    print password
    

    user = User.query.filter(User.email==email).first()
    username = user.username.encode("utf-8")
    hashed = user.password.encode("utf-8")
    if user and hashpw(password, hashed) == hashed:
        session["username"] = username
        session["email"] = user.email
        return redirect("/")
    else:
        return "Email or Password is incorrect. Please try again!"

@app.route('/facebook', methods=['POST'])
def check_for_user():
    """Checks database for user with facebook email"""

    facebook_id = request.form.get('id')
    name = request.form.get('name')
    email = request.form.get('email')
    token = request.form.get('token')
    session['token'] = token
    first_name = name.split()[0]
    last_name = name.split()[1]

    print first_name
    print last_name
    print email
    
    user_query = User.query.filter(User.email==email).first()

    if user_query:
        return "user exists"
    else:
        # pop up window asking for password
        # add user to database
        return "need email"

@app.route('/facebook/login', methods=['POST'])
def login_user():

    new = request.form.get('new')

    # if new user
    if new == "true":
        email = request.form.get('email')
        password = request.form.get('id')
        password = b, password
        # Hash a password for the first time, with a randomly-generated salt
        hashed = bcrypt.hashpw(password, bcrypt.gensalt())
        username = request.form.get('username')
        name = request.form.get('name')
        first_name, last_name = name.split()
        # Get profile picture
        token = session['token']
        picture_url = 'https://graph.facebook.com/v2.8/me/picture?type=large&access_token={}'.format(token)
        r = requests.get(picture_url)
        picture = str(r.url)

        user = User(email=email, password=hashed, first_name=first_name,
                    last_name=last_name, username=username, facebook_id=password,
                    profile_picture=picture)
        db.session.add(user)
        db.session.commit()

    # If user exists
    else:
        email = request.form.get('email')
        username = request.form.get('username')
        user = User.query.filter(User.email==email).first()

    session["username"] = username
    session["email"] = email

    # Get Facebook friend ids
    token = session['token']
    url = 'https://graph.facebook.com/v2.8/me?fields=id%2Cname%2Cfriends%7Bid%2Cname%7D&access_token={}'.format(token)
    r = requests.get(url)
    results = json.loads(r.text)
    print results
    # if results:
    #     friends = []
    #     for friend in results['friends']['data']:
    #         facebook_id = str(friend['id'])
    #         friends.append(facebook_id)

    #     for facebook_id in friends:
    #         # Find friend's user information
    #         fb_friend = User.query.filter(User.facebook_id==facebook_id).first()
    #         print fb_friend
    #         # If it finds it, get the email
    #         if fb_friend:
    #             friend_email = fb_friend.email
    #             email = request.form.get('email')
    #             friend_query = Friend.query.filter(Friend.user==email, Friend.fb_friend==friend_email).first()
    #             if not friend_query:
    #                 friendship = Friend(user=email, fb_friend=friend_email)
    #                 db.session.add(friendship)
    #     db.session.commit()

    return redirect('/')

@app.route('/logout')
def log_user_out():
    """Logs a user out."""

    del session['username']
    del session['email']
    if session.get('token'):
        del session['token']
    public_items = PublicItem.query.all()
    flash("You have successfully logged out!")
    return redirect("/")

@app.route('/popular-items')
def display_public_items():
    public_items = PublicItem.query.all()
    email = session.get("email")
    lists = BucketList.query.filter(BucketList.email==email).all()

    return render_template("public-items.html",
                            public_items=public_items,
                            email=email,
                            lists=lists)

@app.route('/popluar-items.json')
def get_public_item_info():

    public_items = PublicItem.query.all()

    images = []
    for item in public_items:
        image_info = "<li><a href='#'><img src='{}' data-title='{}' data-id='{}' class='public-image'><span class='text-content'>{}</span></a></li>".format(item.image, item.title, item.id, item.title)
        images.append(image_info)

    return jsonify(images)


@app.route('/country-tallies.json')
def get_country_tallies_for_user_items():
    """Get tallies for items per country per user."""
    email = session.get('email')
    if email:
        countries = []
        country_tallies = {}
        bucket_lists = BucketList.query.filter(BucketList.email==email).all()
        for bucket_list in bucket_lists:
            bucket_items = bucket_list.priv_items
            for item in bucket_items:
                if item.checked_off is False:
                    country_name = item.public_item.country
                    country_tallies[country_name] = country_tallies.get(country_name, 0) + 1
        for country, tally in country_tallies.items():
            country = {"country": country, "num_of_items": tally}
            countries.append(country)

            max_country = sorted(country_tallies.items(), key=operator.itemgetter(1))[-1]

        results = {"countries": countries,
                    "max_country": max_country}

    else:
        results = {"countries": None,
                   "max_country": None}

    print country_tallies.items()
    print countries
    print max_country
    # results = countries
    return jsonify(results)

@app.route('/friend-tallies.json')
def get_num_of_common_items_per_friend():

    email = session.get('email')
    if email:

        user = User.query.get(email)
        user_items = set([])
        user_bucket_lists = user.bucket_lists
        for bucket_list in user_bucket_lists:
            user_bucket_items = bucket_list.priv_items
            for bucket_item in user_bucket_items:
                public_item = bucket_item.public_item_id
                user_items.add(public_item)

        # list of user objects for friends
        friends = user.followers

        counts = []
        common_items_count = {}
        for friend in friends:
            name = friend.first_name + " " + friend.last_name
            friend_items = set([])
            friend_email = friend.email
            friend_buckets = friend.bucket_lists
            for bucket_list in friend_buckets:
                bucket_items = bucket_list.priv_items
                for item in bucket_items:
                    friend_items.add(item.public_item_id)
            common_items = len(user_items & friend_items)
            common_items_count[name] = [common_items, friend_email]
        for key, value in common_items_count.iteritems():
            items_tally = {"name": key, "common_items": value[0], "id": value[1]}
            counts.append(items_tally)

        max_friend = sorted(common_items_count.items(), key=operator.itemgetter(1))[-1]
        print counts

        results = {"items_tally": counts,
                   "max_friend": max_friend}

    return jsonify(results)

@app.route('/friend-tallies-subqueries')
def friend_items_subqueries():
    email = session.get('email')
    user = User.query.get(email)

    user_items = db.session.query(BucketList.id).filter_by(email=email).subquery()

    friends = user.followers

    counts = []
    common_items_count = {}
    for friend in friends:
        name = friend.first_name + " " + friend.last_name
        friend_email = friend.email
        friend_items = db.session.query(BucketList.id).filter_by(email=friend_email).subquery()

        total = db.session.query(PrivateItem.public_item_id).filter(PrivateItem.list_id.in_(friend_items)).count()
        common_items_count[name] = total

    return jsonify(common_items_count)


@app.route('/profile-user')
def display_user_profile():
    """Display information about the user"""

    email = session.get('email')
    return render_template("user-profile.html",
                            email=email)

@app.route('/facebook-email', methods=['POST'])
def get_facebook_id_from_form():

    email = request.form.get('friend-email')
    friend_user = User.query.get(email)
    friend_facebook_id = friend_user.facebook_id

    return redirect("/profile/{}".format(friend_facebook_id))



@app.route('/profile/<facebook_id>')
def display_profile(facebook_id):
    """Displays a user's profile page"""

    friend_email = request.args.get('friend-email')
    email = session['email']
    if friend_email:

        user = User.query.filter(User.email==friend_email).one()
        private_items = (db.session.query(PrivateItem).join(BucketList).join(User)
                    .filter(User.email==user.email).all())
    else:
        user = User.query.filter(User.facebook_id==facebook_id).one()
        private_items = (db.session.query(PrivateItem).join(BucketList).join(User)
                    .filter(User.email==user.email).all())
    user_bucket_lists = BucketList.query.filter(BucketList.email==email).all()

    friend_items = []
    for item in private_items:
        image_info = ("<li><a href='#'><img src='{}' data-title='{}' data-id='{}'"
            "data-lat='{}' data-lon='{}' data-tour='{}' data-complete='{}' data-country='{}'"
            "data-address='{}' data-image='{}'"
            "class='friend-image public-image'><span class='text-content'>{}</span></a></li>"
                                ).format(item.public_item.image, item.public_item.title, 
                                item.id, item.public_item.latitude, item.public_item.longitude, 
                                item.tour_link, item.checked_off, item.public_item.country, 
                                item.public_item.address.encode("utf-8"), item.public_item.image, item.public_item.title)
        friend_items.append(image_info)
    print friend_items

    return render_template('profile.html',
                            user=user,
                            private_items=private_items,
                            friend_items=friend_items,
                            email=email,
                            lists=user_bucket_lists)

@app.route('/facebook/friends')
def display_fb_friends():
    """Displays a user's facebook friends."""
    email = session['email']
    user = User.query.get(email)
    # list of user objects for friends
    friends = user.followers

    return render_template("facebook-friends.html",
                            friends=friends,
                            email=email)

@app.route('/facebook/post', methods=['POST'])
def post_completed_bucket_item():
    """Post to Facebook about completed bucket item"""
    token = session['token']
    graph = facebook.GraphAPI(access_token=token, version='2.8')

    image = request.form.get('image')
    title = request.form.get('title')
    caption = "I just checked {} off of my bucket list!".format(title)


    attachment =  {
    'name': 'Wanderlust Ave',
    'link': 'www.wanderlustave.com',
    'caption': caption,
    'picture': image
    }

    graph.put_wall_post(message=caption, attachment=attachment)
    return "Wall post successful"

@app.route('/my-lists', methods=['GET', 'POST'])
def display_bucket_lists():
    """Display users bucket lists."""

    if request.method == 'GET':
        email = str(session.get("email"))
        user_bucket_lists = BucketList.query.filter(BucketList.email==email).all()

        if email:
            user = User.query.get(email)
            progress_results = user.get_progress()

            items = progress_results['total_items']
            checked_off_items = progress_results['checked_items']
            return render_template("user-lists.html",
                                    email=email,
                                    lists=user_bucket_lists,
                                    checked_off_items=checked_off_items,
                                    items=items)
        else:
            flash("You are not signed in")
            return redirect('/login')

    else:
        title = request.form.get('title')
        print title
        email = session.get('email')

        user_list = BucketList.query.filter(BucketList.email==email,
                                            BucketList.title==title).first()
        if not user_list:
            title = request.form.get('title')
            email = session.get('email')
            new_list = BucketList(email=email, title=title)
            db.session.add(new_list)
            db.session.commit()
            list_id = new_list.id

            return jsonify({"list_id": list_id})
        elif title == "":
            return "Please choose a title for your list"

        # flash("You already have a list named {}".format(title))
        return "Duplicate List"

# Id of list object instead of title
@app.route('/my-lists/<list_id>')
def display_bucket_list(list_id):
    """Displays a user's bucket list."""

    email = session.get("email")
    bucket_list = BucketList.query.filter(BucketList.id==list_id).first()
    b_list_id = list_id
    images = []
    for item in bucket_list.priv_items:
        image_info = ("<li><a href='#'><img src='{}' data-title='{}' data-id='{}'"
            "data-lat='{}' data-lon='{}' data-tour='{}' data-complete='{}' data-country='{}'"
            "data-address='{}' data-image='{}' data-listid='{}'"
            "class='private-image'><span class='text-content'>{}</span></a></li>"
                                ).format(item.public_item.image, item.public_item.title, 
                                item.id, item.public_item.latitude, item.public_item.longitude, 
                                item.tour_link, item.checked_off, item.public_item.country, 
                                item.public_item.address.encode("utf-8"), item.public_item.image, b_list_id, item.public_item.title)
        images.append(image_info)
    print images

    places = []

    print bucket_list
    print bucket_list.priv_items
    for item in bucket_list.priv_items:
        item_coordinates = [item.public_item.title,
                            item.public_item.latitude,
                            item.public_item.longitude,
                            item.public_item.address.encode('UTF-8'),
                            item.public_item.image.encode('UTF-8')]
        places.append(item_coordinates)
    
    # change back to UTF-8
    for location in places:
        location[0] = str(location[0])

    all_list_items = PrivateItem.query.filter(PrivateItem.list_id==b_list_id).count()
    checked_off_items = PrivateItem.query.filter(PrivateItem.list_id==b_list_id, PrivateItem.checked_off==True).count()
    progress = str(checked_off_items) + "/" + str(all_list_items)

    titles = [item.public_item.title for item in bucket_list.priv_items]

    return render_template("bucket-list.html", 
                           bucket_list=bucket_list,
                           b_list_id=b_list_id,
                           gm_api_key=gm_api_key,
                           places=places,
                           progress=progress,
                           email=email,
                           images=images,
                           checked_off_items=checked_off_items,
                           num_of_days=5,
                           titles=titles)

# def get_bucket_items(list_id):
#     email = session.get('email')
#     bucket_list = BucketList.query.filter(BucketList.id==list_id).first()
#     images = []
#     for item in bucket_list.priv_items:
#         image_info = "<li><a href='#'><img src='{}' data-title='{}' data-id='{}' class='public-image'><span class='text-content'>{}</span></a></li>".format(item.public_item.image, item.public_item.title, item.public_item.id, item.public_item.title)
#         images.append(image_info)

#     return images



@app.route('/progress.json')
def get_progress_of_all_items():
    email = str(session.get("email"))
    all_items = request.args.get("all_items")
    b_list_id = request.args.get("list_id")
    if email:
        if all_items == "True":
            user = User.query.get(email)
            progress_results = user.get_progress()
            return jsonify(progress_results)
        else:
            bucket_list = BucketList.query.filter(BucketList.id==b_list_id).first()

            all_list_items = PrivateItem.query.filter(PrivateItem.list_id==b_list_id).count()
            checked_off_items = PrivateItem.query.filter(PrivateItem.list_id==b_list_id, PrivateItem.checked_off==True).count()
            if all_list_items == 0:
                progress_results = {"checked_off_items": 0,
                                    "all_list_items": 0,
                                    "percentage_complete": 0}
                return jsonify(progress_results)

            else:
                progress = str(checked_off_items) + "/" + str(all_list_items)
                percentage_complete = (float(checked_off_items)/all_list_items) * 100
                progress_results = {"checked_off_items": checked_off_items,
                                    "all_list_items": all_list_items,
                                    "percentage_complete": percentage_complete}
                return jsonify(progress_results)

def allowed_file(filename):
    return ("." in filename and filename.rsplit('.', 1)[1].lower() 
            in ALLOWED_EXTENSIONS)

@app.route('/add-item/process', methods=['POST'])
def process_add_bucket_item():
    """Checks if item already exists in a list, if not then adds it."""
    # Check if request has the file part
    print "Request files: ", request.files
    if 'image' not in request.files:
        print "No file part"
        flash('No file part')
        return "No file"
    file = request.files['image']
    if file.filename == "":
        print "filename is empty"
        flash("No selected file")
        return "No selected file"
    if file and allowed_file(file.filename):
        print "About to upload to s3"
        filename = secure_filename(file.filename)
        fp = StringIO()
        file.save(fp)
        fp.seek(0)

        aws_key = AWS_KEY_ID
        aws_secret_key = AWS_SECRET_KEY

        bucket_name = "wanderlist-images"
        s3 = boto3.client('s3')
        response = s3.put_object(Bucket=bucket_name, Key=filename, Body=fp, ACL='public-read', ContentType='image/jpeg')

        image_url = "https://s3-us-west-1.amazonaws.com/{}/{}".format(bucket_name, filename)
            

        title = request.form.get('title')
        tour_link = request.form.get('tour-link')
        image = image_url
        description = request.form.get('description')
        list_title = request.form.get('list')
        latitude = request.form.get('latitude')
        longitude = request.form.get('longitude')
        address = request.form.get('address')
        address_components = address.split(",")
        country = address_components[-1].lstrip()
        if country == "USA":
            country = "United States"
        elif country == "UK":
            country = "United Kingdom"
        elif country == "Vietnam":
            country = "Viet Nam"
        elif country == "Czechia":
            country = "Czech Republic"
        print list_title
        print latitude
        print longitude

        # Query for the public item with the title as the input title
        item = PublicItem.query.filter(PublicItem.title.ilike(title)).first()

        # If there is not a public item with that title, create a public and private item    
        if not item:
            item = PublicItem(title=title,image=image,description=description,
                                      latitude=latitude, longitude=longitude,
                                      country=country, address=address)
            db.session.add(item)
            db.session.commit()
        public_id = item.id
        email = session.get('email')
        b_list = BucketList.query.filter(BucketList.title==list_title, BucketList.email==email).first()
        b_list_id = b_list.id
        create_private_item(public_id, b_list_id, tour_link)
        return redirect('/my-lists/{}'.format(b_list_id))

def create_private_item(public_id, list_id, tour_link):
    email = session.get('email')
    print public_id
    print list_id
    print email
    user = User.query.filter(User.email==email).one()
    print user
    print user.email
    # Check if a private item for that user exists with that title
    private_item = (db.session.query(PrivateItem).join(BucketList).join(User)
                    .filter(PrivateItem.public_item_id==public_id, 
                            User.email==email).first())

    # If there is a private item with that title
    if private_item:
        return "Duplicate title!"

    new_item = PrivateItem(public_item_id=public_id,
                           list_id=list_id,
                           tour_link=tour_link)
    db.session.add(new_item)
    db.session.commit()
    return "Item added"

@app.route('/add-item/public', methods=['POST'])
def add_item_from_public():
    email = session['email']
    public_id = request.form.get('id')
    list_title = request.form.get('title')
    print list_title
    bucket_list = BucketList.query.filter(BucketList.title==list_title,
                                          BucketList.email==email).first()
    bucket_list_id = bucket_list.id
    print "About to print list_id"
    print bucket_list_id
    tour_link = None
    private_item = create_private_item(public_id, bucket_list_id, tour_link)
    print private_item
    return "Item added"

@app.route('/delete-item', methods=['POST'])
def delete_priv_item():
    """Deletes an item from a user's bucket list."""

    item_id = request.form.get('item-id')
  
    if item_id:
        item = PrivateItem.query.filter(PrivateItem.id==item_id).one()
        db.session.delete(item)
        db.session.commit()

    return redirect('/')

@app.route('/update-item', methods=['POST'])
def update_item_details():
    """Updates a user's bucket item details."""

    email = session.get("email")
    tour_link = request.form.get("edit-tour-link")
    checked_off = request.form.get("edit-checked-off")
    item_id = request.form.get("edit-item-id")

    item = PrivateItem.query.get(item_id)

    if tour_link:
        item.tour_link = tour_link

    if checked_off == "completed":
        item.checked_off = True
    else:
        item.checked_off = False
    
    db.session.commit()

    return "Item Updated"

@app.route('/check-off-item', methods=['POST'])
def check_off_item():
    """Changes the status of the item as completed."""

    item_id = request.form.get("item-id")
    list_id = request.form.get("list-id")

    item = PrivateItem.query.filter(PrivateItem.id==item_id).first()
    item.checked_off = True
    db.session.commit()

    return redirect('/{}/{}'.format(list_id,item_id))


@app.route('/search')
def process_search_form():
    """Processes a search form."""

    form_input = request.args.get('public-search')
    keywords = form_input.split()
    matched_items = []
    email = session.get('email')
    lists = BucketList.query.filter(BucketList.email==email).all()

    for word in keywords:
        items = PublicItem.query.filter(PublicItem.title.ilike("%{}%".format(word))).all()
        for item_object in items:
            if item_object not in matched_items:
                matched_items.append(item_object)

    return render_template('search-results.html', 
                            matched_items=matched_items,
                            email=email,
                            lists=lists,
                            country_name=form_input)


@app.route('/search/country', methods=['GET', 'POST'])
def search_country_items():
    """Displays choropleth map and queries public items table for items in a country. Returns matches"""

    if request.method == 'GET':
        print "Method = Get"
        email = session.get("email")
        print email
        countries = Country.query.all()
        country_names = []
        for country in countries:
            country_names.append(country.name)

        sorted_countries = sorted(country_names)
        print sorted_countries

        return render_template("choropleth-map.html",
                               countries=sorted_countries,
                               email=email)

    else:
        email = session.get('email')
        lists = BucketList.query.filter(BucketList.email==email).all()
        country_name = request.form.get("country-name")
        matched_items =  PublicItem.query.filter(PublicItem.country==country_name).all()

        return render_template("search-results.html",
                                email=email,
                                lists=lists,
                                matched_items=matched_items,
                                country_name=country_name)


@app.route('/search/country/user-items')
def search_items_by_country_per_user():
    """Gets all private items of a user for a specific country."""

    country = request.args.get("country-name-user")
    email = session.get('email')
    bucket_lists = BucketList.query.filter(BucketList.email==email).all()

    matched_items = []

    for bucket_list in bucket_lists:
        for bucket_item in bucket_list.priv_items:
            if bucket_item.public_item.country == country:
                matched_items.append(bucket_item)

    return render_template("private-search.html",
                            matched_items=matched_items,
                            email=email,
                            lists=bucket_lists,
                            country=country)


@app.route('/countries.json')
def calculate_items_per_country():

    file = open("population.csv")
    countries = []

    for line in file:
        data = line.split(",")
        country = data[1]
        countries.append(country)
    file.close()

    country_tallies = []
    for country in countries:
        items_count = PublicItem.query.filter(PublicItem.country==country).count()
        country = {"Country (or dependent territory)": country, 
                   "Population": items_count}
        country_tallies.append(country)

    return jsonify(country_tallies)

@app.route('/map')
def display_google_map():
    """Display markers on a map for all public items"""

    email = session.get("email")
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
                           places=places,
                           email=email)


if __name__ == "__main__":

    app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False
    app.debug = True
    app.jinja_env.auto_reload = app.debug  # make sure templates, etc. are not cached in debug mode
    if app.config['TESTING'] is True:
        connect_to_db(app, "postgresql:///testdb")
    else:
        connect_to_db(app)

    # Use the DebugToolbar
    # DebugToolbarExtension(app)
    
    app.run(port=5000, host='0.0.0.0')