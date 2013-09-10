require 'test_helper'

class DownloadAndUploadsControllerTest < ActionController::TestCase
  setup do
    @download_and_upload = download_and_uploads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:download_and_uploads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create download_and_upload" do
    assert_difference('DownloadAndUpload.count') do
      post :create, download_and_upload: {  }
    end

    assert_redirected_to download_and_upload_path(assigns(:download_and_upload))
  end

  test "should show download_and_upload" do
    get :show, id: @download_and_upload
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @download_and_upload
    assert_response :success
  end

  test "should update download_and_upload" do
    patch :update, id: @download_and_upload, download_and_upload: {  }
    assert_redirected_to download_and_upload_path(assigns(:download_and_upload))
  end

  test "should destroy download_and_upload" do
    assert_difference('DownloadAndUpload.count', -1) do
      delete :destroy, id: @download_and_upload
    end

    assert_redirected_to download_and_uploads_path
  end
end
