# Public Data Web Services

Public data exposed via Web services.

The project is live here: http://data.web-engineering.it (the server wakes up on request, so please be patient...)

# System setup

If you want to run the system locally, all you have to do is:

* Clone the repo
* Install its dependencies:
  * Install gems: `$ bundle install`
  * Install mongoDB: if you have not already installed it, you can check it out at https://docs.mongodb.com/manual/installation/
  * Install PostgreSQL: if you have not already installed it, you can check it out at https://www.postgresql.org/download/

* Create and initialize the Postgres database:
  `$ rake db:create db:migrate db:seed`

# Run and check it out

Now that you have all the components installed, you can run the server with `$ rails server` and checkout the system at `http://localhost:3000`

# Services Currently Live

## Italian Cities

Live at: http://data.web-engineering.it/italian/cities

Lists & search Italian cities, by name and zipcode. 

You can find a list of all cities at the following paths: 
* `/italian/cities/names`
* `/italian/cities/zipcodes`

You can also check if a specific city name or zipcode exists, passing the name or the zipcode in the url: 
  * `/italian/cities/{name|zipcode}`

If the name/zipcode exists, its information is shown, else a 404 error is returned.

You can retrieve each response in HTML or JSON format. For a JSON response you should append a `.json` to the path, or you should request it with a `format=json` parameter, e.g.:
  * `/names.json`
  * `/names?format=json`

Data source: https://github.com/matteocontrini/comuni-json/blob/master/comuni.json

# Contributing

Just open an issue for any question or improvement proposal. 

Thanks!
