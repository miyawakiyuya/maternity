class UsersController < ApplicationController

  def new
  end

  def create
   user = User.new(user_params)
   user.user_id = current_user.id
   user.save
   redirect_to my_page_users_path(current_user)
  end

  def show
   @user = current_user
   @week =  40 - (( @user.date.to_date - Date.today) / 7).to_f
   @week_day = ((@week - @week.to_i)*7).round
   @day = @user.date.to_date - Date.today
   if @day >= 0
    @day
   else
    @day = 0
   end
  end

  def edit
   @user = current_user
  end

  def update
   @user = current_user
   @user.update(user_params)
   redirect_to my_page_users_path(current_user)
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