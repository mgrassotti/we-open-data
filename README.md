# WE Open Data

Open Data exposed via Web Services.

# System setup

If you want to run the system locally, all you have to do is:

* Clone the repo
* Install its dependencies:
  * Install gems: `$ bundle install`
  * Install mongoDB: if you have not already installed it, you can check it out at https://docs.mongodb.com/manual/installation/
  
* Initialize the database:
  `$ rake db:seed`

# Run and check it out

Now that you have all the components installed, you can run the server with `$ rails server` and checkout the system at `http://localhost:3000`

# Services Live Now

## Italian Cities

Live at: http://localhost:3000/italian/cities

Lists & searches Italian cities, by name and zipcode. 

You can find a list of all cities at the following paths: 
* `/italian/cities/names`
* `/italian/cities/zipcodes`

You can also check if a specific city name or zipcode exists, passing the name or the zipcode in the url: 
  * `/italian/cities/{name|zipcode}`

If the name/zipcode exists, its information is shown, else a 404 error is returned.

You can retrieve each response in HTML or JSON format. For a JSON response you should append a `.json` to the path, or you should request it with a `format=json` parameter, e.g.:
  * `/names.json`
  * `/names?format=json`

The cities data is stored and loaded from the file `/lib/data/italian/cities.json`

Data source: https://github.com/matteocontrini/comuni-json/blob/master/comuni.json

## Gov IT Packages

Live at: http://localhost:3000/gov_it

Lists & presents Italian government & local government bodies open data.

You can find a list of all data packages at the following paths: 
* `/gov_it/packages`

You can also look for a specific package, passing the name in the url: 
  * `/gov_it/packages/{name}`

You can retrieve each response in HTML or JSON format. For a JSON response you should append a `.json` to the path, or you should request it with a `format=json` parameter.

Data source: https://www.dati.gov.it/api/3/action/package_list

# Contributing

Just open an issue for any question or improvement proposal. 

Thanks!
