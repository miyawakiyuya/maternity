class UsersController < ApplicationController

  def new
  end

  def create
   user = User.new(user_params)
   user.user_id = current_user.id
   user.save
   redirect_to users_my_page_path(current_user)
  end

  def show
   @user = current_user
  end

  def edit
   @user = current_user
  end

  def update
  # binding.pry
   @user = current_user
   @user.update(user_params)
   redirect_to users_my_page_path(current_user)
  end

  def quit
  end

  def out
   @user = current_user
   @user.update(is_valid: false)
   reset_session
   redirect_to root_path
  end

end

private


def user_params
    params.require(:user).permit(:name, :email, :date)
end