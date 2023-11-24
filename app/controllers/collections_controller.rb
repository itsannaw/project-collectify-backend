# frozen_string_literal: true

class CollectionsController < ApplicationController
  include ApplicationHelper
  before_action :set_collection, only: %i[show update destroy]
  before_action :authorize_request, except: %i[show all_collections]
  before_action :login_if_authorized, only: %i[show index]


  def index
    @collections = Collection.where(user_id: params[:user_id]) if params[:user_id]
    render json: @collections, status: :ok
  end

  def all_collections
    @collections = Collection.all
    render json: @collections, status: :ok
  end

  def show
    data = get_serializer(CollectionSerializer, @collection, { current_user: @current_user })
    render json: data, status: :ok
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
