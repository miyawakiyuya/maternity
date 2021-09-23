class DiariesController < ApplicationController
  def index
    @diaries = current_user.diarys
  end

  def show
    @diaries = current_user.diarys.where(start_time: params[:date].to_date.all_day)
  end

  def new
    @diary = Diary.new
  end

  def create
    diary = Diary.new(diary_params)
    diary.user_id = current_user.id
    diary.save
    redirect_to diaries_path

  end

  def show
    @diaries = current_user.diarys.where(start_time: params[:id].to_date.all_day)
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    diary = Diary.find(params[:id])
    diary.update(diary_params)
    redirect_to diaries_path
  end

  def destroy
    diary = Diary.find(params[:id])
    diary.destroy
    redirect_to diaries_path
  end

  private

  def diary_params
    params.require(:diary).permit(:user_id, :image, :title, :body, :start_time)
  end

end
