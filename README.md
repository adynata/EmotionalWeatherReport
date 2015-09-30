# EmotionalWeatherReport

Hey there! You're in Robin's (new, fancy) front-end branch!

This branch will hopefully completely mirror the main EWR except for the parts that are different, namely, the React-end.

Registration: currently only requires an email and a password. Location is optional. If one isn't given it will be set to zip code 94612 (much like Apple Weather starts with Cupertino). This might or might not be Oakland. International zipcodes are a new and different thing that I have not full explored.

[9/29/15] NOW WITH WEBPACK!

To run:
get this repo!
<a href="https://docs.npmjs.com/getting-started/installing-node">install node</a>
run `bundle install`
run `npm install`
run `gulp javascript:dev`

now all the frontend JS is bundled into assets/javascripts/build/

`rails s`

and you're good to go!

if you're trying to access signup/signin and the homepage signup/signin isn't working, the Devised routes are, right now, still up! you can sign up at /users/sign_up, and you can login at /login
