class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      sign_in(user)
      redirect_to links_url
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def edit
    @user = current_user
    render :edit
  end

  def update

  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
