# EmotionalWeatherReport

Hey there! You're in Robin's front-end branch!

This branch will hopefully completely mirror the main EWR except for the parts that are different, namely, the React-end.

Registration: currently only requires an email and a password. Location is optional. If one isn't given it will be set to zip code 94612 (much like Apple Weather starts with Cupertino). This might or might not be Oakland. International zipcodes are a new and different thing that I have not full explored.

If you're trying to get to a route that has so far only been defined in rake routes:

1) go into views > layouts >application.html.erb

2) comment out line 29 (<%= react_router 'MyRoutes', 'HistoryLocation', {data: @forecast} %>)

3) comment in line 30 (<%= yield %>)

4) go into config > routes.rb

5) comment out line 11 (get "/*path" => "application#index")
