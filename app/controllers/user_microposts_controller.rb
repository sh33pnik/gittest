class UserMicropostsController < ApplicationController
  before_action :set_user
  before_action :set_micropost, only: [:show, :edit, :update, :destroy]

  def index
    @microposts = @user.microposts
  end

  def new
    @micropost = Micropost.new
  end

  def show
  end

  def edit
  end

  def create
    @micropost = @user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to user_microposts_url(@user), notice: "Micropost was successfully created."
    else
      render :new
    end
  end

  def update
    if @micropost.update(micropost_params)
      redirect_to user_micropost_url(@user, @micropost), notice: "Micropost was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @micropost.destroy
    redirect_to user_microposts_url(@user), notice: "Micropost was successfully destroyed."
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_micropost
    @micropost = @user.microposts.find(params[:id])
  end

  def micropost_params
      params.require(:micropost).permit(:content)
    end
end
