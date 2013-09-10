require 'spec_helper'

describe User do
  
  before(:each) do
      @user = {
        :name => "aa",
        :email => "aa@mail.com",
        :password => "123456",
        :password_confirmation => "123456",
        :encrypted_password => "e10adc3949ba59abbe56e057f20f883e"
      }

    end
    
  it "should create a new instance given a valid attribute" do
      User.create!(@user)
  end
  
#  it "is not valid without a title" do
#     @atr.name = nil
#     @atr.should_not be_valid
#   end 

  #  check name not be_valid
  it "should require an name" do
      no_name_user = User.new(@user.merge(:name => ""))
      no_name_user.should_not be_valid
  end
  #  check email address not be_valid
  it "should require an email address" do
       no_email_user = User.new(@user.merge(:email => ""))
       no_email_user.should_not be_valid
   end
  #  check password not be_valid
  it "should require an password" do
         no_password_user = User.new(@user.merge(:password => ""))
         no_password_user.should_not be_valid
  end
  #  check password_confirmation not be_valid
  it "should require an password confirmation" do
         no_passconfrim_user = User.new(@user.merge(:password_confirmation => ""))
         no_passconfrim_user.should_not be_valid
  end
  #  check email unique
  it "should reject duplicate email addresses" do
     User.create!(@user)
     user_with_duplicate_email = User.new(@user)
     user_with_duplicate_email.should_not be_valid
   end
   
  it "should accept valid email addresses" do
     addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
     addresses.each do |address|
       valid_email_user = User.new(@user.merge(:email => address))
       valid_email_user.should be_valid
     end
   end
   
  it "should reject invalid email addresses" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        invalid_email_user = User.new(@user.merge(:email => address))
        invalid_email_user.should_not be_valid
      end
    end

    
  describe "passwords" do
  
      before(:each) do
        @user_new = User.new(@user)
      end
  
      it "should have a password attribute" do
        @user_new.should respond_to(:password)
      end
  
      it "should have a password confirmation attribute" do
        @user_new.should respond_to(:password_confirmation)
      end
  end
  
  
  describe "password validations" do
  
      it "should require a password" do
        User.new(@user.merge(:password => "", :password_confirmation => "")).
          should_not be_valid
      end
  
      it "should require a matching password confirmation" do
        User.new(@user.merge(:password_confirmation => "invalid")).
          should_not be_valid
      end
  
      it "should reject short passwords" do
        short = "a" * 5
        hash = @user.merge(:password => short, :password_confirmation => short)
        User.new(hash).should_not be_valid
      end
  
    end
    
  
end
