class UsersController < ApplicationController
before_action :authenticate_user!
  def index
  	@books = User.all
  	@book = Book.new
    @user = User.find(current_user.id)
  end

  def show
  	@books = Book.where(user_id: params[:id])
  	@book = Book.new
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
    if @user.id != current_user.id
       redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    	 flash[:update] = 'You have updated user successfully.'
        redirect_to user_path(@user.id)
    else
		   render "users/edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
