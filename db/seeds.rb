
Cities.all.each {|c| City.new(c).save! } unless City.all.any?

Service.create(
  name: "Italian Cities", 
  path: "/italy/cities",
  subpaths: "/names; /zipcodes",
  description: "Lists Italian cities names and zipcodes.\n"\
    "You can also look for a city name or zipcode, with the following paths:\n"\
    "`/names/{name}`\n"\
    "`/zipcodes/{zipcode}`\n"\
    "If the name/zipcode is not found, a 404 error is returned.\n"\
    "Else its information is shown.",
  data_source: "https://github.com/matteocontrini/comuni-json/blob/master/comuni.json",
  version: "1.0"
) unless Service.find_by(name: "Italian Cities")
