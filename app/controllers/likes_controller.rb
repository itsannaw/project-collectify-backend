class LikesController < ApplicationController
  include ApplicationHelper
  before_action :authorize_request

  def create
    @item = Item.find(params[:item_id])
    @current_user.likes.create(item: @item)
    render json: { message: 'Item liked!'}, status: :ok
  end

  def destroy
    @item = Item.find(params[:item_id])
    like = @current_user.likes.find_by(item: @item)
    like.destroy
    render json: { message: 'Item disliked!'}, status: :ok
  end
end
