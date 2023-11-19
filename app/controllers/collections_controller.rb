# frozen_string_literal: true

class CollectionsController < ApplicationController
  before_action :set_collection, only: %i[show edit update destroy]
  before_action :authorize_request, except: [:show]

  def index
    @collections = Collection.all
    @collections = @collections.where(user_id: params[:user_id]) if params[:user_id]
    render json: @collections, status: :ok
  end

  def all_collection
    @collections = Collection.all
  end

  def show
    render json: CollectionSerializer.new(@collection).serializable_hash[:data][:attributes], status: :ok
  end

  def create
    image_uploads_controller = ImageUploadsController.new
    image_url = image_uploads_controller.upload_to_google_storage(params[:file])
    params[:user_id] = @current_user.id
    @collection = Collection.new(collection_params.merge(image_url:))
    if @collection.save
      render json: CollectionSerializer.new(@collection).serializable_hash[:data][:attributes], status: :created
    else
      render json: { errors: @collection.errors },
             status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @collection.update(collection_params)
      render json: { message: 'The collection has been successfully updated.' }, status: :ok
    else
      render :edit
    end
  end

  def destroy
    @collection.destroy
    render json: { message: 'Successfully!' }, status: :ok
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.permit(:title, :desc, :image_url, :category_id, :user_id,
                  :custom_string1_name, :custom_string1_enabled, :custom_string2_name, :custom_string2_enabled,
                  :custom_string3_name, :custom_string3_enabled, :custom_text1_name, :custom_text1_enabled,
                  :custom_text2_name, :custom_text2_enabled, :custom_text3_name, :custom_text3_enabled,
                  :custom_int1_name, :custom_int1_enabled, :custom_int2_name, :custom_int2_enabled,
                  :custom_int3_name, :custom_int3_enabled, :custom_bool1_name, :custom_bool1_enabled,
                  :custom_bool2_name, :custom_bool2_enabled, :custom_bool3_name, :custom_bool3_enabled,
                  :custom_date1_name, :custom_date1_enabled, :custom_date2_name, :custom_date2_enabled,
                  :custom_date3_name, :custom_date3_enabled)
  end
end
