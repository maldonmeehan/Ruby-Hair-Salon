require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add a stylist route', {:type => :feature}) do
  it('takes the owner to a page where they entered stylist') do
    visit('/')
    click_link('Stylists')
    expect(page). to have_content('Add a stylist')
  end
end
