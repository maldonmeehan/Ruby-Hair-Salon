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
