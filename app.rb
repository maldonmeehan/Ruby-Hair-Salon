require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('./lib/client')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'hair_salon_test'})

get("/") do
  erb(:index)
end

get("/stylists") do
  @stylists = Stylist.all()
  erb(:stylists)
end

get("/stylists/new") do
  erb(:stylist_form)
end

post("/stylists") do
  name = params.fetch("name")
  @stylist = Stylist.new({:name => name, :id => nil})
  @stylist.save()
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @clients = Client.find_by_stylist_id(@stylist.id)
  erb(:stylist)
end

get('/stylists/:id/edit') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_edit)
end

patch('/stylists/:id') do
  name = params.fetch('name')
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  @clients = Client.find_by_stylist_id(@stylist.id)
  erb(:stylist)
end

delete('/stylists/:id/delete') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/clients') do
  @clients = Client.all()
  erb(:clients)
end

get('/clients/new') do
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:client_form)
end

post("/clients") do
  name = params.fetch("name")
  stylist_id = params.fetch("stylist_id").to_i()
  @client = Client.new({:id => nil, :name => name, :stylist_id => stylist_id})
  @client.save()
  @clients = Client.all()
  erb(:clients)
end

get('/clients/:id') do
  @client = Client.find(params.fetch("id").to_i())
  @stylist = Stylist.find(@client.stylist_id)
  erb(:client)
end

get('/clients/:id/edit') do
  @client = Client.find(params.fetch("id").to_i())
  erb(:client_edit)
end

patch('/clients/:id') do
  name = params.fetch('name')
  @client = Client.find(params.fetch("id").to_i())
  @client.update({:name => name})
  @stylist = Stylist.find(@client.stylist_id)
  erb(:client)
end
