class UserMicropostsController < ApplicationController
  before_action :set_user
  def index
    @microposts = @user.microposts
  end

  def new
    @micropost = Micropost.new
  end

  def show
    @micropost = @user.microposts.find(params[:id])
  end

  def edit
    @micropost = @user.microposts.find(params[:id])
  end

  def create
    @micropost = Micropost.new(micropost_params)

    respond_to do |format|
      if @micropost.save
        format.html { redirect_to user_microposts_url(@user), notice: "Micropost was successfully created." }
        format.json { render :show, status: :created, location: @micropost }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to user_micropost_url(@micropost), notice: "Micropost was successfully updated." }
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
    redirect_to :users
  end

  def destroy
    @micropost.destroy
    respond_to do |format|
      format.html { redirect_to user_microposts_url(@user), notice: "Micro was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def micropost_params
      params.require(:micropost).permit(:content, :user_id)
    end
end
