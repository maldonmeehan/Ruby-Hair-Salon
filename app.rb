require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('./lib/client')
require('pg')

DB = PG.connect({:dbname => 'hair_salon_test'})

get('/') do
  erb(:index)
end

get('stylists/new') do
  # @stylists = Stylist.all()
  erb(:stylist)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/stylist/new') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/clients') do
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:clients)
end

get('/stylists/:id') do
  @stylists = Stylist.all()
  @stylist = Stylist.find(params.fetch("id").to_i())
  @clients = Client.all()
  erb(:stylist)
end

get('/clients/:id') do
  @clients = Client.all()
  @client = Client.find(params.fetch("id").to_i())
  @stylist = Stylist.find(@client.stylist_id())
  @stylists = Stylist.all()
  erb(:client)
end

post('/stylists') do
  name = params.fetch('stylist-name')
  stylist = Stylist.new({:id => nil, :name => name})
  stylist.save()
  @stylists = Stylist.all()
  erb(:stylists)
end

post('/clients') do
  name = params.fetch('client-name')
  stylist_id = params.fetch('stylist_id')
  client = Client.new({:id => nil, :name => name, :stylist_id => stylist_id})
  client.save()
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:clients)
end

post('/stylists/:id') do
  name = params.fetch('client-name')
  stylist_id = params.fetch('stylist_id')
  client = Client.new({:id => nil, :name => name, :stylist_id => stylist_id})
  client.save()
  @stylist = Stylist.find(params.fetch("id").to_i())
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:stylist)
end

patch('/stylists/:id') do
  name = params.fetch('new_name')
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:stylist)
end

patch('/clients/:id') do
  @client = Client.find(params.fetch("id").to_i())
  name = params.fetch('new-client-name')
  stylist_id = params.fetch('new-stylist-id')
  @stylist = Stylist.find((stylist_id).to_i())
  @client.update({:name => name, :stylist_id => stylist_id})
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:client)
end

delete('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:stylists)
end
