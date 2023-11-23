class RatingsController < ApplicationController
  include ApplicationHelper
  before_action :authorize_request

  def create
    params[:user_id] = @current_user.id
    @rating = Rating.find_by(collection_id: params[:collection_id], user_id: params[:user_id])

    if !params[:rating]
      @rating.destroy
      render json: { message: 'Rating deleted!'}, status: :ok
    else
      if @rating.present?
        update_or_save(@rating.update(rating: params[:rating]))
      else
        @rating = Rating.new(rating_params)
        update_or_save(@rating.save)
      end
    end
  end

  def update_or_save(condition)
    if condition
      render json: { message: "Рейтинг успешно сохранен!" }
    else
      render json: { error: "Не удалось сохранить рейтинг", details: @rating.errors.full_messages }, status: :unprocessable_entity
    end
    puts
  end

  private

  def rating_params
    params.permit(:rating, :collection_id, :user_id)
  end
end
