class ImageUploadsController < ApplicationController
  require 'google/cloud/storage'

  def create
    file = params[:file]
    uploaded_url = upload_to_google_storage(file)
    Collection.create(image_url: uploaded_url)
    render json: { url: uploaded_url }
  end

  def upload_to_google_storage(file)

    storage = Google::Cloud::Storage.new(
      project_id: ENV['GOOGLE_CLOUD_PROJECT_ID'],
      credentials: JSON.parse(ENV['GOOGLE_CLOUD_STORAGE_CREDENTIALS'])
    )

    bucket = storage.bucket('collectify')

    uploaded_file = bucket.create_file(
      file.tempfile.path,
      "uploads/#{SecureRandom.uuid}_#{file.original_filename}"
    )

    uploaded_file.public_url
  end
end
