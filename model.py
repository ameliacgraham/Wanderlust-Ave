from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import func
from datetime import datetime
db = SQLAlchemy()



class User(db.Model):
    """Users of WanderList."""

    __tablename__ = "users"

    username = db.Column(db.String(32), primary_key=True)
    password = db.Column(db.String(32), nullable=False)
    first_name = db.Column(db.String(32), nullable=False)
    last_name = db.Column(db.String(32), nullable=False)
    email = db.Column(db.String(100), nullable=False)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<User username: {}, name: {}{}>".format(self.username, self.first_name,
                                                        self.last_name)

    def get_progress(self):
        """Gets a user's progress for all items."""

        total_items = (db.session.query((BucketList.username))
                                 .join(PrivateItem)
                                 .filter(BucketList.username==self.username).count())

        checked_items = (db.session.query((BucketList.username))
                                 .join(PrivateItem)
                                 .filter(BucketList.username==self.username, 
                                         PrivateItem.checked_off==True).count())
        progress = {"total_items": total_items, "checked_items":checked_items}
        return progress


class BucketList(db.Model):
    """Bucket lists of travel items."""

    __tablename__ = "bucket_lists"

    list_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    username = db.Column(db.String(32), db.ForeignKey('users.username'), nullable=False)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<Bucket List list_id: {}, title: {}, username: {}>".format(
                                                                          self.list_id, 
                                                                          self.title, 
                                                                          self.username)

    user = db.relationship("User",
                            backref=db.backref("bucket_lists",
                                               order_by=username))

class PublicItem(db.Model):
    """Public bucket list items."""

    __tablename__ = "public_items"

    public_item_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    latitude = db.Column(db.Float, nullable=False)
    longitude = db.Column(db.Float, nullable=False)
    image = db.Column(db.String(200), nullable=False)
    description = db.Column(db.String(300), nullable=True)
    retired = db.Column(db.Boolean, default=False)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<Public Item public_item_id: {} title: {}>".format(self.public_item_id, self.title)

def example_data():
        """Create example data for the test database."""
        item1 = PublicItem(title='See The Eiffel Tower', 
                image='https://s3-us-west-1.amazonaws.com/wanderlist-images/Tour_eiffel_at_sunrise_from_the_trocadero.jpg',
                latitude=48.858093,
                longitude=2.294694)
        db.session.add(item1)
        user = User(first_name="Hackbright",
                    last_name="Academy",
                    username="balloonicorn",
                    password="party",
                    email="balloonicorn@gmail.com")
        db.session.add(user)
        bucket_list = BucketList(list_id=1, 
                                 title="My Bucket List",
                                 username="balloonicorn")
        db.session.add(bucket_list)
        db.session.commit()

class PrivateItem(db.Model):
    """Private bucket list items."""

    __tablename__ = "private_items"

    priv_item_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    public_item_id = db.Column(db.Integer, db.ForeignKey("public_items.public_item_id"))
    list_id = db.Column(db.Integer, db.ForeignKey("bucket_lists.list_id"))
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

        return "<PrivateItem priv_item_id: {} list_id: {}>".format(self.priv_item_id,
                                                                   self.list_id)

class Journal(db.Model):
    """Private bucket list items."""

    __tablename__ = "journals"

    journal_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    priv_item_id = db.Column(db.Integer, db.ForeignKey("private_items.priv_item_id"))
    title = db.Column(db.String(100), nullable=True)
    date = db.Column(db.DateTime, default=datetime.now, nullable=False)

    priv_item = db.relationship("PrivateItem",
                                    backref=db.backref("journals",
                                                order_by=priv_item_id))

    def __repr__(self):
        """Provide helpful representation when printed."""  
        
        return "<Journal journal_id: {} priv_item_id: {}>".format(self.journal_id,
                                                                  self.title)  


def connect_to_db(app, db_uri="postgresql:///wander_list"):
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
    db.create_all()
    example_data()