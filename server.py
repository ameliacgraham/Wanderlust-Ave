
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

@app.route('/register')
def show_registration_form():
    """Display registration form."""

    return render_template('registration-form.html')

@app.route('/register/complete', methods=['POST'])
def process_registation_form():
    """Process registration form"""

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

@app.route('/login')
def show_login():
    """Displays login form"""

    return render_template("login.html")

@app.route('/login/process', methods=['POST'])
def process_login_info():
    """Checks if user email and password exist on same account, then logs in or redirects."""

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


@app.route('/my-lists/add')
def add_bucket_list():
    """Add new bucket list."""

    title = request.form.get('title')
    username = request.form.get('username')

    try:
        user_list = BucketList.query.filter(BucketList.username==username,
                                            BucketList.title==title).one()
    except Exception, e:
        new_list = BucketList(username=username, title=title)
        db.session.add(new_list)
        db.session.commit()
        flash("Your list has been created!")
        return redirect('/my-lists')

    flash("You already have a list named {}".format(title))
    return redirect('/my-lists/add')

@app.route('/my-lists/<title>')
def display_bucket_list(title):
    """Displays a user's bucket list."""

    bucket_list = BucketList.query.filter(BucketList.title==title).one()

    return render_template("bucket_list.html", bucket_list=bucket_list)



if __name__ == "__main__":

    app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = True
    app.debug = True
    app.jinja_env.auto_reload = app.debug  # make sure templates, etc. are not cached in debug mode

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)
    
    app.run(port=5000, host='0.0.0.0')