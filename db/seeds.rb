require_relative '../lib/json_loader.rb'

unless City.all.any?
  City.create! JsonLoader.new("/lib/data/italy/cities.it.json").data
end

unless Service.all.any?
  Service.create! JsonLoader.new("/lib/data/services.json").data
end
