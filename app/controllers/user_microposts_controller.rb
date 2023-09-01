class UserMicropostsController < ApplicationController
  before_action :set_user
  def index
    @microposts = @user.microposts
  end

  def new
  end

  def show
    @micropost = @user.microposts.find(params[:id])
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
    @micropost.destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
