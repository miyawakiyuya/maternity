class WeightsController < ApplicationController
  def index
    @weight = Weight.new
    @weights = current_user.weights.page(params[:page]).per(7).order(date: "desc")
    @chart = []
    @weights.each do |weight|
      @chart.push([weight.date.strftime("%d日"), weight.weight])
    end
    @chart = @chart.reverse
    # binding.pry
  end

  def edit
    @weight = Weight.find(params[:id])
  end

  def create
    weight = Weight.new(weight_params)
    weight.user_id = current_user.id
    weight.save
    redirect_to weights_path
  end

  def update
    weight = Weight.find(params[:id])
    weight.update(weight_params)
    redirect_to weights_path
  end

  def destroy
    weight = Weight.find(params[:id])
    weight.destroy
    redirect_to weights_path
  end

  private

  def weight_params
    params.require(:weight).permit(:user_id, :weight, :date)
  end
end
