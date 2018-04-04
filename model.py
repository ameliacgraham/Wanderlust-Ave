from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import func
from datetime import datetime
db = SQLAlchemy()


class User(db.Model):
    """Users of WanderList."""

    __tablename__ = "users"

    email = db.Column(db.String(200), primary_key=True)
    username = db.Column(db.String(60), nullable=False)
    password = db.Column(db.String(70), nullable=False)
    first_name = db.Column(db.String(32), nullable=False)
    last_name = db.Column(db.String(32), nullable=False)
    facebook_id = db.Column(db.String(50), nullable=True)
    profile_picture = db.Column(db.String(200), default="https://s3-us-west-1.amazonaws.com/wanderlist-images/Wanderlust+Logo.png")

    followed = db.relationship("User",
                                secondary="friends",
                                primaryjoin=("Friend.fb_friend == User.email"),
                                secondaryjoin=("Friend.user == User.email"),
                                backref=db.backref("followers"))

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<User email: {}, name: {} {}>".format(self.email, self.first_name,
                                                        self.last_name)

    def get_progress(self):
        """Gets a user's progress for all items."""

        total_items = (db.session.query((BucketList.email))
                                 .join(PrivateItem)
                                 .filter(BucketList.email==self.email).count())

        checked_items = (db.session.query((BucketList.email))
                                 .join(PrivateItem)
                                 .filter(BucketList.email==self.email, 
                                         PrivateItem.checked_off==True).count())
        if total_items == 0:
            percent_complete = 0

        else:
            percent_complete = (float(checked_items)/total_items) * 100


        progress = {"total_items": total_items, 
                    "checked_items":checked_items, 
                    "percent_complete": percent_complete}
        return progress


class BucketList(db.Model):
    """Bucket lists of travel items."""

    __tablename__ = "bucket_lists"

    id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(32), db.ForeignKey('users.email'), nullable=False)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<Bucket List id: {}, title: {}, email: {}>".format(
                                                                      self.id, 
                                                                      self.title, 
                                                                      self.email)

    user = db.relationship("User",
                            backref=db.backref("bucket_lists",
                                               order_by=email))
class PublicItem(db.Model):
    """Public bucket list items."""

    __tablename__ = "public_items"

    id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    latitude = db.Column(db.Float, nullable=False)
    longitude = db.Column(db.Float, nullable=False)
    country = db.Column(db.String(100), nullable=False)
    address = db.Column(db.String(200), nullable=False)
    image = db.Column(db.String(200), nullable=False)
    description = db.Column(db.String(300), nullable=True)
    retired = db.Column(db.Boolean, default=False)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<PublicItem id: {} title: {}>".format(self.id, self.title)

def example_data():
        """Create example data for the test database."""
        item1 = PublicItem(title='See the Eiffel Tower', 
                image='https://s3-us-west-1.amazonaws.com/wanderlist-images/Tour_eiffel_at_sunrise_from_the_trocadero.jpg',
                latitude=48.858093,
                longitude=2.294694,
                country="France",
                address="Champ de Mars, 5 Avenue Anatole France, 75007 Paris, France")
        db.session.add(item1)
        user = User(first_name="Hackbright",
                    last_name="Academy",
                    password="party",
                    email="balloonicorn@gmail.com",
                    username="balloonicorn")
        db.session.add(user)
        bucket_list = BucketList(title="My Bucket List",
                                 email="balloonicorn@gmail.com")
        db.session.add(bucket_list)
        db.session.commit()

class PrivateItem(db.Model):
    """Private bucket list items."""

    __tablename__ = "private_items"

    id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    public_item_id = db.Column(db.Integer, db.ForeignKey("public_items.id"), nullable=False)
    list_id = db.Column(db.Integer, db.ForeignKey("bucket_lists.id"), nullable=False)
    tour_link = db.Column(db.String(200), nullable=True)
    checked_off = db.Column(db.Boolean, default=False, nullable=False)
    date_created = db.Column(db.DateTime, default=datetime.now, nullable=False)
    date_completed = db.Column(db.DateTime, nullable=True)
    priority = db.Column(db.String(6), nullable=True)

    public_item = db.relationship("PublicItem",
                                    backref=db.backref("priv_items",
                                               order_by=public_item_id))

    bucket_list = db.relationship("BucketList",
                                    backref=db.backref("priv_items",
                                           order_by=list_id))

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<PrivateItem id: {} list_id: {} public_item_id: {}>".format(self.id,
                                                                   self.list_id,
                                                                   self.public_item_id)

    # def get_most_popular_items():
    #     most_popular = PrivateItem.query(PrivateItem.public_item_id, func.count(PrivateItem.public_item_id)).group_by(PrivateItem.public_item_id).all()
    #     return most_popular

class Journal(db.Model):
    """Journals for private items."""

    __tablename__ = "journals"

    id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    priv_item_id = db.Column(db.Integer, db.ForeignKey("private_items.id"))
    title = db.Column(db.String(100), nullable=True)
    date = db.Column(db.DateTime, default=datetime.now, nullable=False)

    priv_item = db.relationship("PrivateItem",
                                    backref=db.backref("journals",
                                                order_by=priv_item_id))

    def __repr__(self):
        """Provide helpful representation when printed."""  
        
        return "<Journal id: {} priv_item_id: {}>".format(self.id,
                                                          self.title)

class Friend(db.Model):
    """Facebook friend connections."""

    __tablename__ = "friends"

    id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    user = db.Column(db.String(200), db.ForeignKey("users.email"), nullable=False)
    fb_friend = db.Column(db.String(200), db.ForeignKey("users.email"), nullable=False)


    def __repr__(self):
        """Provide helpful representation when printed."""  

        return "<Friend id: {} user: {} fb_friend: {}>".format(self.id, self.user, self.fb_friend)

class Country(db.Model):
    """Information about countries."""

    __tablename__ = "countries"

    id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    code = db.Column(db.String(5), nullable=False)
    name = db.Column(db.String(200), nullable=False)

    def __repr__(self):
        """Provide helpful representation when printed."""  

        return "<Country id: {} code: {} name: {}>".format(self.id, self.code, self.name)

class Month(db.Model):
    """Month information."""

    __tablename__ = "months"

    id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    num = db.Column(db.Integer, nullable=False)
    name = db.Column(db.String(10), nullable=False)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<Month id: {} num: {} name: {}>".format(self.id, self.num, self.name)

class CountryMonth(db.Model):
    """Association table for countries and shoulder months."""

    __tablename__ = "country_months"

    id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    country_id = db.Column(db.Integer, db.ForeignKey("countries.id"), nullable=False)
    month = db.Column(db.String(10), db.ForeignKey("months.id"), nullable=False)

    def __repr__(self):
        """Provide helpful representation when printed."""  

        return "<CountryMonth id: {} country: {} month: {}>".format(self.id, self.country_id, self.month)


class City(db.Model):
    """Information about cities."""

    __tablename__ = "cities"

    id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    country_id = db.Column(db.Integer, db.ForeignKey("countries.id"), nullable=True)
    name = db.Column(db.String(100), nullable=False)
    code = db.Column(db.String(10), nullable=False)

    country = db.relationship("Country",
                                    backref=db.backref("cities",
                                                order_by=country_id))

    def __repr__(self):
        """Provide helpful representation when printed."""  

        return "<City id: {} country_id: {} name: {}>".format(self.id, self.country_id, self.name)

class Airport(db.Model):
    """Information about airports."""

    __tablename__ = "airports"

    id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    country_id = db.Column(db.Integer, db.ForeignKey("countries.id"), nullable=True)
    city_id = db.Column(db.Integer, db.ForeignKey("cities.id"), nullable=True)
    code = db.Column(db.String(5), nullable=False)
    name = db.Column(db.String(100), nullable=False)
    latitude = db.Column(db.Float, nullable=True)
    longitude = db.Column(db.Float, nullable=True)

    def __repr__(self):
        """Provide helpful representation when printed."""  

        return "<Airport id: {} code: {} name: {}>".format(self.id, self.code, self.name)

class Airline(db.Model):
    """Information about airlines."""

    __tablename__ = "airlines"

    id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    code = db.Column(db.String(5), nullable=False)

    def __repr__(self):
        """Provide helpful representation when printed."""  

        return "<Airline id: {} code: {} name: {}>".format(self.id, self.code, self.name)




def connect_to_db(app, db_uri="postgresql:///wanderlust_ave"):
    """Connect the database to our Flask app."""

    # Configure to use our PstgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = db_uri
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)


if __name__ == "__main__":
    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.

    from server import app
    connect_to_db(app)
    print "Connected to DB."
    # db.create_all()
    # example_data()