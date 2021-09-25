class WeightsController < ApplicationController
  def index
    @weight = Weight.new
    @weights = current_user.weights
    @chart = []
    # @weights.each_with_index do |weight, i|
    #   @chart[i] = [@weights[i].date.strftime("%Y年%m月%d日"), @weights[i].weight]
    # end
    @weights.each do |weight|
      @chart.push([weight.date.strftime("%Y年%m月%d日"), weight.weight])
    end
    # @weight = @weights.date.strftime("%Y年%m月%d日")
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
