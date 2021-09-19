class UsersController < ApplicationController
  def show
   @user = current_user
  end

  def edit
   @user = current_user
  end

  def update
   @user = current_user
   @user.update(user_params)
   redirect_to users_my_page_path
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
    params.require(:user).permit(:name, :email)
end