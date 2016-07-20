require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('./lib/client')
require('pg')

DB = PG.connect({:dbname => 'hair_salon_test'})

get("/") do
  erb(:index)
end

get("/stylists") do
  @stylests = Stylist.all()
  erb(:stylists)
end

get("/stylists/new") do
  erb(:stylist_form)
end

post("/stylists") do
  name = params.fetch("name")
  stylist = Stylist.new({:id => nil, :name => name})
  stylist.save()
  @stylists = Stylist.all()
  erb(:stylists)
end
