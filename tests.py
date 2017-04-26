import unittest

from server import app
from model import db, example_data, connect_to_db
from selenium import webdriver
import time
import os


# class BucketTests(unittest.TestCase):
#     """Tests for WanderList."""

#     def setUp(self):
#         self.client = app.test_client()
#         app.config['TESTING'] = True

#     def test_homepage(self):
#         result = self.client.get("/")
#         self.assertIn("Inspiration", result.data)

#     def test_mylists(self):
#         """Test if user can't see my-lists if they are not signed in"""
#         result = self.client.get("/my-lists", follow_redirects=True)
#         self.assertIn("You are not signed in", result.data)

#     def test_item_page(self):
#         result = self.client.get("/my-lists/1")
#         self.assertIn("Create a new item", result.data)

#     def test_registration(self):
#         result = self.client.post("/register", data={"first-name": "Auden",
#                                                      "last-name": "Ezra",
#                                                      "username": "cats",
#                                                      "password": "purr",
#                                                      "email": "auden@gmail.com"},
#                                                 follow_redirects=True)
#         self.assertIn("Hi cats!", result.data)

#     def test_duplicate_registration(self):
#         result = self.client.post("/register", data={"first-name": "Hackbright",
#                                                      "last-name": "Academy",
#                                                      "username": "balloonicorn",
#                                                      "password": "party",
#                                                      "email": "balloonicorn@gmail.com"},
#                                                 follow_redirects=True)
#         self.assertIn("balloonicorn already exists", result.data)


#     def test_login(self):
#         result = self.client.post("/login", data={"username": "balloonicorn",
#                                                   "password": "party"},
#                                             follow_redirects=True)
#         self.assertIn("Create a new list", result.data)

# class SeleniumTests(unittest.TestCase):

#     def setUp(self):
#         self.client = app.test_client()
#         app.config['TESTING'] = True
#         self.browser = webdriver.Chrome()

#         # Connect to test database (uncomment when testing database)
#         connect_to_db(app, "postgresql:///testdb")

#         # Create tables and add sample data (uncomment when testing database)
#         db.create_all()
#         example_data()

#     def tearDown(self):
#         # (uncomment when testing database)
#         db.session.close()
#         db.drop_all()
#         self.browser.quit()

#     def test_title(self):
#         self.browser.get('http://localhost:5000/')



    ### second test login with different get results

class DatabaseTests(unittest.TestCase):
    """Flask tests that use the database."""

    def setUp(self):
        """Stuff to do before every test."""

        self.client = app.test_client()
        app.config['TESTING'] = True
        self.browser = webdriver.Chrome()

        # Connect to test database (uncomment when testing database)
        connect_to_db(app, "postgresql:///testdb")

        # Create tables and add sample data (uncomment when testing database)
        db.create_all()
        example_data()

    def test_registration(self):
        self.browser.get('http://localhost:5000/')
        self.assertEqual(self.browser.title, 'Wanderlust Ave')
        time.sleep(5)
        register_button = self.browser.find_element_by_id('register-button')
        register_button.click()
        time.sleep(2)
        first_name = self.browser.find_element_by_id("first-name-registration")
        first_name.send_keys("Alexa")
        time.sleep(2)
        last_name = self.browser.find_element_by_id("last-name-registration")
        last_name.send_keys("Smith")
        time.sleep(2)
        username = self.browser.find_element_by_id("username-registration")
        username.send_keys("alexa123")
        time.sleep(2)
        password = self.browser.find_element_by_id("password-registration")
        password.send_keys("alex123")
        time.sleep(2)
        email = self.browser.find_element_by_id("email-registration")
        email.send_keys("alexa@gmail.com")
        register_submit = self.browser.find_element_by_id('register-submit')
        register_submit.click()
        time.sleep(2)
        homepage_button = self.browser.find_element_by_id("wanderlust-ave-button")
        homepage_button.click()
        time.sleep(3)
        login_button = self.browser.find_element_by_id("login-button-modal")
        login_button.click()
        time.sleep(2)
        email_login = self.browser.find_element_by_id("email-login")
        email_login.send_keys("alexa@gmail.com")
        time.sleep(2)
        password_login = self.browser.find_element_by_id("password-login")
        password_login.send_keys("alex123")
        time.sleep(2)
        login_modal_submit = self.browser.find_element_by_id("login-modal-submit")
        login_modal_submit.click()
        time.sleep(2)
        explore_by_country = self.browser.find_element_by_id("search-by-country")
        explore_by_country.click()
        time.sleep(2)
        my_lists = self.browser.find_element_by_id("my-lists-button")
        my_lists.click()
        time.sleep(2)
        trip_planner = self.browser.find_element_by_id("trip-planner")
        trip_planner.click()
        time.sleep(2)
        keyword_search = self.browser.find_element_by_id("keyword-search")
        keyword_search.send_keys("castle lavender")
        search_button = self.browser.find_element_by_id("search-button")
        search_button.click()
        result = self.browser.find_element_by_id('public-item-2')
        time.sleep(3)


    def tearDown(self):
        """Do at end of every test."""

        # (uncomment when testing database)
        db.session.close()
        db.drop_all()


if __name__ == '__main__':
    unittest.main()
