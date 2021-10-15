class DiariesController < ApplicationController
  def index
    @diaries = current_user.diarys
    @diary = Diary.new
  end

  def show
    @diaries = current_user.diarys.where(start_time: params[:date].to_date.all_day)
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.user_id = current_user.id
    if @diary.save
      redirect_to diaries_path
    else
      @diaries = current_user.diarys
      render :index
    end
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
