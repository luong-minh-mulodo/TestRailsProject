require 'test_helper'

class SendMailsControllerTest < ActionController::TestCase
  setup do
    @send_mail = send_mails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:send_mails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create send_mail" do
    assert_difference('SendMail.count') do
      post :create, send_mail: { body: @send_mail.body, subject: @send_mail.subject, to: @send_mail.to }
    end

    assert_redirected_to send_mail_path(assigns(:send_mail))
  end

  test "should show send_mail" do
    get :show, id: @send_mail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @send_mail
    assert_response :success
  end

  test "should update send_mail" do
    patch :update, id: @send_mail, send_mail: { body: @send_mail.body, subject: @send_mail.subject, to: @send_mail.to }
    assert_redirected_to send_mail_path(assigns(:send_mail))
  end

  test "should destroy send_mail" do
    assert_difference('SendMail.count', -1) do
      delete :destroy, id: @send_mail
    end

    assert_redirected_to send_mails_path
  end
end
