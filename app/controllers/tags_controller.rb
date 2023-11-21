# frozen_string_literal: true

class TagsController < ApplicationController

  def index
    @tags = Tag.all
    render json: @tags, status: :ok
  end
end
