
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


if __name__ == "__main__":

    app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = True
    app.debug = True
    app.jinja_env.auto_reload = app.debug  # make sure templates, etc. are not cached in debug mode

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)
    
    app.run(port=5000, host='0.0.0.0')