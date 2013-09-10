require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User, :name => "aa",
    :email => "aa@mail.com").as_new_record)
    
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=new][method=post]", users_new_path, "post" do
    end
  end
end
