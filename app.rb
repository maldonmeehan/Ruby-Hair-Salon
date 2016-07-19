require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('./lib/client')
require('pg')

DB = PG.connect({:dbname => 'hair_salon_test'})

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/stylists/:id') do
  @stylists = Stylist.all()
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

post('/stylists') do
  name = params.fetch('stylist-name')
  stylist = Stylist.new({:id => nil, :name => name})
  stylist.save()
  @stylists = Stylist.all()
  erb(:stylists)
end
