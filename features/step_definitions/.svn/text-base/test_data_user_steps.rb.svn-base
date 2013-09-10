
Given(/^I want contructor user name with "(.*?)", password with "(.*?)",email with "(.*?)"$/) do |arg1, arg2, arg3|
#  @user=User.new(name:arg1,password:arg2,email:arg3) 
#  @user=User.new(:name =>arg1,:password => arg2,:email=>arg3) 
  @user = User.new(:name => arg1,
                    :email => arg3,
                   :password => arg2,
                   :password_confirmation =>arg2)
  @count1=User.count
end

When(/^I call create User$/) do
  @user.save
  @count2=User.count 
end

Then(/^I should see user have databaes$/) do
  @count2.should== @count1 + 1
end

Given(/^delete: I find user name with "(.*?)"$/) do |arg1|
  @user=User.find_by_name(arg1)
   assert_not_nil(@user,"user found")
   @count1=User.count
end

When(/^I will delete name "(.*?)"$/) do |arg1|
  @user.destroy
   @count2=User.count
end

Then(/^I should see not user database$/) do
  #pending # express the regexp above with the code you wish you had
  @count2.should==@count1-1
end