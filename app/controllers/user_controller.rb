class UserController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  def index
    @user = User.paginate(page: params[:page], per_page: 10)
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to user_path(user)
    else
      @user = user
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_update_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to user_index_path
    else
      redirect_to user_index_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :surname, :email).merge(created_at: Time.now, updated_at: Time.now)
  end

  def user_update_params
    params.require(:user).permit(:name, :surname, :email).merge(updated_at: Time.now)
  end
end
