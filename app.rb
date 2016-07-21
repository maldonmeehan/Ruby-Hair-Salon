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

#
# get('/questions/:id') do
#   @question = Question.find(params.fetch('id').to_i())
#   erb(:question_edit)
# end
#
# get('/questions/:id/edit') do
#   @question = Question.find(params.fetch('id').to_i())
#   erb(:question_edit)
# end
#
# patch('/questions/:id') do
#   description = params.fetch("description")
#   @question = Question.find(params.fetch("id").to_i())
#   @question.update({:description => description})
#   erb(:question_edit)
# end
#
# delete('/questions/:id/delete') do
#   @question = Question.find(params.fetch('id').to_i())
#   @question.delete()
#   @questions = Question.all()
#   erb(:questions)
# end
#
# get('/surveys/:id/edit') do
#   @survey = Survey.find(params.fetch("id").to_i())
#   erb(:survey_edit)
# end
#
# patch('/surveys/:id/edit') do
#   name = params.fetch('name')
#   @survey = Survey.find(params.fetch("id").to_i())
#   @survey.update({:name => name})
#   erb(:survey)
# end
#
