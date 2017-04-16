from sqlalchemy import func
from flask_sqlalchemy import SQLAlchemy
from model import PublicItem, Country, City, Airport, Airline


from model import connect_to_db, db
from server import app
import requests
import os
import json

travel_payouts_api = os.environ['TRAVEL_PAYOUTS_API']

def load_public_items():
    """Load public items into database."""

    print "Users"

    for row in open("seed-data/public-items.py"):
        row = row.rstrip()
        title, address, country, latitude, longitude, image = row.split("|")

        item = PublicItem(title=title,
                    address=address,
                    country=country,
                    latitude=latitude,
                    longitude=longitude,
                    image=image)

        db.session.add(item)
    db.session.commit()

def load_airports():

    print "Airports"

    url = "http://api.travelpayouts.com/data/airports.json?token={}".format(travel_payouts_api)

    r = requests.get(url)
    data = r.text
    results = json.loads(data)

    for key in results:
        airport_name = key['name'].encode('utf-8')
        code = key['code']
        country_code = key['country_code'].encode('utf-8')
        coordinates = key['coordinates']
        if coordinates:
            latitude = key['coordinates']['lat']
            longitude = key['coordinates']['lon']
        country = Country.query.filter(Country.code==country_code).first()
        city_code = key['code'].encode('utf-8')
        city = City.query.filter(City.code==city_code).first()
        if country and not city and not coordinates:
            country_id = country.id
            airport = Airport(name=airport_name,
                              code=code,
                              country_id=country_id,
                              city_id=city_id)
            db.session.add(airport)
        if city and not country and not coordinates:
            city_id = city.id
            airport = Airport(name=airport_name,
                              code=code,
                              city_id=city_id)
            db.session.add(airport)

        if city and coordinates and not country:
            latitude = key['coordinates']['lat']
            longitude = key['coordinates']['lon']
            city_id = city.id
            airport = Airport(name=airport_name,
                              code=code,
                              city_id=city_id,
                              latitude=latitude,
                              longitude=longitude)
            db.session.add(airport)

        if country and coordinates and not city:
            country_id = country.id
            latitude = key['coordinates']['lat']
            longitude = key['coordinates']['lon']
            airport = Airport(name=airport_name,
                              code=code,
                              country_id=country_id,
                              latitude=latitude,
                              longitude=longitude)
            db.session.add(airport)

        if coordinates and not country and not city:
            latitude = key['coordinates']['lat']
            longitude = key['coordinates']['lon']
            airport = Airport(name=airport_name,
                              code=code,
                              latitude=latitude,
                              longitude=longitude)
            db.session.add(airport)

        if city and country and coordinates:
            country_id = country.id
            city_id = city.id
            airport = Airport(name=airport_name,
                              code=code,
                              country_id=country_id,
                              city_id=city_id,
                              latitude=latitude,
                              longitude=longitude)
            db.session.add(airport)

    db.session.commit()

def load_cities():

    print "Cities"

    url = "http://api.travelpayouts.com/data/cities.json?token={}".format(travel_payouts_api)

    r = requests.get(url)
    data = r.text
    results = json.loads(data)

    for key in results:
        city_name = key['name'].encode('utf-8')
        city_code = key['code'].encode('utf-8')
        country_code = key['country_code'].encode('utf-8')
        country = Country.query.filter(Country.code==country_code).first()
        if country:
            country_id = country.id
            city = City(name=city_name, code=city_code, country_id=country_id)
        else:
            city = City(name=city_name, code=city_code)
        db.session.add(city)

    db.session.commit()

def load_countries():

    print "Countries"

    url = "http://api.travelpayouts.com/data/countries.json?token={}".format(travel_payouts_api)

    r = requests.get(url)
    data = r.text
    results = json.loads(data)

    for key in results:
        country_name = key['name']
        country_code = key['code']
        country = Country(name=country_name, code=country_code)
        db.session.add(country)

    db.session.commit()

def load_airlines():

    print "Airlines"

    url = "http://api.travelpayouts.com/data/airlines.json?token={}".format(travel_payouts_api)

    r = requests.get(url)
    data = r.text
    results = json.loads(data)

    for key in results:
        airline_name = key['name']
        code = key['iata']
        if code:
            airline = Airline(name=airline_name, code=code)
            db.session.add(airline)
    db.session.commit()

def set_val_user_id():
    """Set value for the next public_id after seeding database"""

    # Get the Max user_id in the database
    result = db.session.query(func.max(PublicItem.id==id)).one()
    max_id = int(result[0])

    # Set the value for the next user_id to be max_id + 1
    query = "SELECT setval('public_items_id_seq', :new_id)"
    db.session.execute(query, {'new_id': max_id + 1})
    db.session.commit()


if __name__ == "__main__":
    connect_to_db(app)

    # In case tables haven't been created, create them
    db.create_all()

    # Import different types of data
    load_public_items()
    load_airlines()
    load_airports()
    load_cities()
    load_countries()