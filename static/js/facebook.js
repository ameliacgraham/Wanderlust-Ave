$(document).ready(function() {
  // When a user submits the modal form with email and username
  // $("#email-username-submit").on('submit', function(evt) {
    // $("#facebook-login-registration").modal("hide");
    // evt.preventDefault();
    // console.log("About to submit modal");
    // // Get the values from the form
    // var username = $("#username").val();
    // var email = $("#email").val();
    // var name = $("#facebook-name").val();
    // var id = $("#facebook-id").val();
    // var formInputs = {"new": true, "username": username, "email": email, "password": id, "name": name};

    // // Make an AJAX request to the route that creates a user and then logs in
    // $.post('/facebook-login', formInputs, 
    //                             function() { console.log('Post request new user worked');})
  // });
  $("#logout-button").on('click', function () {
    FB.getLoginStatus(function(response) {
      FB.logout(function() {
        window.location = '/logout';
      });
    })
  })
});


 // This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
  console.log('statusChangeCallback');
  console.log(response);
  // The response object is returned with a status field that lets the
  // app know the current login status of the person.
  // Full docs on the response object can be found in the documentation
  // for FB.getLoginStatus().
  if (response.status === 'connected') {
    // Logged into your app and Facebook.
    console.log(response.authResponse.accessToken);
    var token = response.authResponse.accessToken;

    //Makes a request to Graph API to get name and email of user logged in.
    FB.api('/me?fields=id,name,email', function(response) {
      console.log(response.id);
      console.log(response.email);
      console.log(response.name);
      console.log('Successful login for: ' + response.name);
      var name = response.name;
      var id = response.id;
      var email = response.email;

      // AJAX request to check if a user exists with the email provided by facebook
      $.post('/facebook', {"token": token, "name": name, "id":id, "email":email}, 
        function(result) {
          console.log("Back from /facebook");
          if (result === "need email") {
            debugger;
            $("#facebook-id").val(id);
            $("#facebook-name").val(name);
            // pop up modal window asking for email
            $("#facebook-login-registration").modal("show");
          
          }
          // if not "need email"
          else {
            // AJAX request to route to log user in
            $.post('/facebook-login', {"new": false, "email": email}, function() {
              console.log("Post request existing user");
            })
          }
        }); 
  })} else {
    console.log("Not connected");
    // The person is not logged into your app or we are unable to tell.
    document.getElementById('status').innerHTML = 'Please log ' +
      'into this app.';
  }
}

// This function is called when someone finishes with the Login
// Button.  See the onlogin handler attached to it in the sample
// code below.
function checkLoginState() {
  FB.getLoginStatus(function(response) {
    console.log("Got into checkLoginState");
    statusChangeCallback(response);
  });
}

window.fbAsyncInit = function() {
FB.init({
  appId      : '{1322395004515505}',
  cookie     : true,  // enable cookies to allow the server to access 
                      // the session
  xfbml      : true,  // parse social plugins on this page
  version    : 'v2.8' // use graph api version 2.8
});

};
