# frozen_string_literal: true

class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]

  def index
    @collections = Collection.all
  end

  def show

  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)

    if @collection.save
      redirect_to @collection, notice: 'The collection has been successfully created.'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @collection.update(collection_params)
      redirect_to @collection, notice: 'The collection has been successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @collection.destroy
    redirect_to collections_url, notice: 'The collection has been successfully deleted.'
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:title, :desc, :image_url, :category_id, :user_id,
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