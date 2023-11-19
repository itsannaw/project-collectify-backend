# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories, status: :ok
  end
end
