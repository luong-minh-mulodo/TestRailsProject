def create_visitor
  @visitor ||= {  :name => "aa", :email => "aaa@mail.com",
    :password => "123456",  :password_confirmation =>"123456"  }
end
def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, @visitor)
end
def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end
def sign_in
  visit '/users/login'
#  fill_in :email, :with => @visitor[:email]
#  fill_in :password, :with => @visitor[:password]
  fill_in 'Name', :with => 'aa'
       fill_in 'Password', :with => '123456'
  click_button "Login"
end

Given /^I exist as a user$/ do
  create_user
end
Given /^I am logged in$/ do
  create_visitor
  sign_in
end

When /^I look at the list of users$/ do
  sign_in
  visit '/users/'
end


Then /^I should see an list users$/ do
  page.should have_content "LISTING USERS"
end

Then /^I should see my name$/ do
#  create_user
#  sign_in
  page.should have_content "Listing users"
end