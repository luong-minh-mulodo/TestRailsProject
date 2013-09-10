class DownloadAndUploadsController < ApplicationController
  before_action :set_download_and_upload, only: [:show, :edit, :update, :destroy]

  # GET /download_and_uploads
  # GET /download_and_uploads.json
  def index
#    send_file "#{Rails.root}/public/image/img01.jpg"
  end

  # GET /download_and_uploads/1
  # GET /download_and_uploads/1.json
  def download
    send_file "#{Rails.root}/public/image/img01.jpg"
#    redirect_to :action => '/download_and_uploads/index'√∑
  end

  def uploadFile
      post = DownloadAndUpload.save(params[:upload])
      render :text => "File has been uploaded successfully"
  end
end
