require 'capybara/rspec'
require './app'
require "spec_helper"
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('/', {:type => :feature}) do
  it('takes you to root path') do
   visit('/')
     expect(page).to have_content('Welcome to doctor\'s')
 end
end
describe('/specialities', {:type => :feature}) do
  it('lets the user select a speciality from the list') do
    visit('/')
    click_link('Add speciality')
    expect(page).to have_content('Submit')
  end
end
describe('/specialities/:id', {:type => :feature}) do
  it('Shows you the docotrs in the specialty you select') do
    Speciality.new({speciality: 'heart'}).save
    id = Speciality.all[0].id.to_i
    Doctor.new({name: 'Carlos', speciality_id: id})
    visit('/speciality/:id')
    click_link('heart')
    expect(page).to have_content('Carlos')
  end
end
