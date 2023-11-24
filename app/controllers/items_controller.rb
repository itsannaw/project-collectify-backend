# frozen_string_literal: true

class ItemsController < ApplicationController
  include ApplicationHelper
  before_action :authorize_request, except: %i[show index all_items]
  before_action :login_if_authorized, only: %i[show index]
  before_action :set_item, only: %i[show update destroy like]

  def index
    @items = Item.where(collection_id: params[:collection_id]) if params[:collection_id]
    render json: get_many_serializer(ItemSerializer, @items, { current_user: @current_user }), status: :ok
  end

  def liked_items
    @likes = Like.where(user_id: @current_user.id)
    items_ids = @likes.map do |like|
      like.item_id
    end

    @items = Item.where(id: items_ids)
    render json: get_many_serializer(ItemSerializer, @items, { current_user: @current_user }), status: :ok
  end

    def all_items
      @items = Item.all.order(created_at: :desc)
      render json: get_many_serializer(ItemSerializer, @items, { current_user: @current_user }), status: :ok
    end

  def show
    data = get_serializer(ItemSerializer, @item, { current_user: @current_user })

    render json: data, status: :ok
  end

  def create
    params[:user_id] = @current_user.id

    @item = Item.new(item_params)
    if @item.save
      create_tags_relations(@item)
      render json: { message: 'Succesfully!' }, status: :created
    else
      render json: { errors: @item.errors },
             status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      render json: { message: 'The item has been successfully updated.' }, status: :ok
    else
      render json: { errors: @item.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  def like
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def create_tags_relations(item)
    params[:tags].each do |tag|
      new_tag = Tag.find_or_create_by(title: tag)
      item.item_tags.create(item_id: @item.id, tag_id: new_tag.id)
    end
  end

  def item_params
    params.require(:item).permit(:title, :user_id, :tags, :collection_id, :custom_string1, :custom_string2,
                                 :custom_string3, :custom_text1, :custom_text2, :custom_text3, :custom_int1,
                                 :custom_int2, :custom_int3, :custom_bool1, :custom_bool2, :custom_bool3,
                                 :custom_date1, :custom_date2, :custom_date3)
  end
end
