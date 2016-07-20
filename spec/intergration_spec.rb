require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('launchy')

describe('home page path', {:type => :feature}) do
  it('allows a user to view the homepage') do
    visit('/')
    expect(page).to have_content('Welcome')
  end
end

describe('add a new stylist', {:type => :feature}) do
  it('allows the user to add a stylist') do
    visit('/')
    click_link('Add new stylist')
    fill_in("name", :with => 'David Mallet')
    click_button('Add stylist')
    expect(page).to have_content('David Mallet')
  end
end

describe('view single stylist instance route', {:type => :feature}) do
  it('allows the user to view a single stylist') do
    visit('/')
    click_link('Add new stylist')
    fill_in("name", :with => 'David Mallet')
    click_button('Add stylist')
    expect(page).to have_content('David Mallet')
    click_link("David Mallet")
    expect(page).to have_content('Individual stylist page')
  end
end

# describe('update a stylists name route', {:type => :feature}) do
#   it('allows the user to update the stylists name') do
#     visit('/')
#     click_link('Add new stylist')
#     fill_in("name", :with => 'David Mallet')
#     click_button('Add stylist')
#     expect(page).to have_content('David Mallet')
#     click_link('David Mallet')
#     click_link("Update")
#     fill_in('name', :with => 'John Mallet')
#     click_button('Update')
#     expect(page).to have_content('John Mallet')
#   end
# end
