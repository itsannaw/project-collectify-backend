# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authorize_request, except: [:show]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    params[:user_id] = @current_user.id
    @item = Item.new(item_params)
    if @item.save
      render json: { message: 'Succesfully!' }, status: :created
    else
      render json: { errors: @item.errors },
             status: :unprocessable_entity
    end

  end

  def update
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:title, :tag_id, :user_id, :collection_id, :custom_string1, :custom_string2,
                                 :custom_string3, :custom_text1, :custom_text2, :custom_text3, :custom_int1,
                                 :custom_int2, :custom_int3, :custom_bool1, :custom_bool2, :custom_bool3,
                                 :custom_date1, :custom_date2, :custom_date3)
  end
end
