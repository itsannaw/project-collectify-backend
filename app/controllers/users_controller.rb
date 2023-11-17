# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index block_users unblock_users delete_users me destroy create_avatar]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user, status: :ok
  end

  def me
    render json:  UserSerializer.new(@current_user).serializable_hash[:data][:attributes], status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: UserSerializer.new(@user).serializable_hash[:data][:attributes], status: :created
    else
      render json: { errors: @user.errors },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{username}
  def update
    return if @user.update(user_params)

    render json: { error: { message: 'Failed to create user', details: @user.errors.full_messages } },
    status: :unprocessable_entity
  end

  def block_users
    users_ids = params[:selectedIds]
    @users = User.where(id: users_ids).update_all(blocked: true)
    if users_ids.include?(@current_user.id)
      render json: { error: 'You have been blocked and logged out!' }, status: :unauthorized
    else
      render json: User.all
    end
  end

  def unblock_users
    users_ids = params[:selectedIds]
    @users = User.where(id: users_ids).update_all(blocked: false)
    render json: User.all
  end

  def delete_users
    users_ids = params[:selectedIds]
    is_in_list = users_ids.include?(@current_user.id)
    @users = User.where(id: users_ids).destroy_all
    if is_in_list
      render json: { error: 'You have been deleted!' }, status: :unauthorized
    else
      render json: User.all
    end
  end

  def destroy
    request.headers['Authorization'] = nil
    render json: { message: 'Logged out successfully' }
  end

  def create_avatar
    image_uploads_controller = ImageUploadsController.new
    file = image_uploads_controller.upload_to_google_storage(params[:file])
    params[:user_id] = @current_user.id
    @current_user.update(avatar: file)
    render json:  { message: 'Successfully!' }
  end

  private

  def find_user
    @user = User.find_by_username!(params[:_username])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(
      :avatar, :first_name, :last_name, :username, :email, :password, :password_confirmation, :blocked
    )
  end
end
