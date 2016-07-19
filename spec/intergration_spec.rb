require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the enter a stylist route', {:type => :feature}) do
  it('takes the owner to a page where they entered stylist') do
    visit('/')
    click_link('Stylists')
    expect(page). to have_content('Add a stylist')
  end
end

describe('the add a stylist route', {:type => :feature}) do
  it('adds a stylist to the list of stylists') do
    visit('/')
    click_link('Stylists')
    fill_in('stylist-name', :with => 'Petra Flannery')
    click_button('Add Stylist')
    expect(page). to have_content('Petra Flannery')
  end
end

describe('adding a client to Zohan Salon', {:type => :feature}) do
  it('adds a client to a Stylist') do
    visit('/')
    click_link('Stylists')
    fill_in('stylist-name', :with => 'Gal')
    click_button('Add Stylist')
    click_link('Gal')
    fill_in('client-name', :with => "Guy")
    click_button('Add Client')
    expect(page).to have_content('Guy')
  end
end
