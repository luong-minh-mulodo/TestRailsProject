require 'spec_helper'
require 'capybara/rspec'


describe "the signup process", :type => :feature do
  before :each do
#    User.make(:user => 'aa', :password => '123456')
  end

  it "signs me in" do
    visit '/users/login'
#    within("#login") do
      fill_in 'Name', :with => 'aa'
      fill_in 'Password', :with => '123456'
#    end
    click_button 'Login'
    page.should have_content 'Listing users'
#    expect(page).to have_content 'Listing users'
  end
end