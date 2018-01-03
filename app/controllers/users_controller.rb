class UsersController < ApplicationController
  before_action :find_user, only:[:show]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    redirect_to '/' unless current_user
    #add messages here
    
  end


  def update
    @user = current_user
    redirect_to user_path(@user)
  end


  private

  def user_params
    params.require(:user).permit(:name,:password,:height,:tickets,:happiness,:nausea,:admin)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
