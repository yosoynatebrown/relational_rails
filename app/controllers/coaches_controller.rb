class CoachesController < ApplicationController
  def index
    @coaches = Coach.all
  end

  def new
  end

  def show
    @coach = Coach.find(params[:id])
  end

  def create
    coach = Coach.new({
      name: params[:coach][:name],
      won_championship: params[:coach][:won_championship] == "on" ? true : false,
      years_coaching: params[:years_coaching].to_i
      })

      coach.save

      redirect_to '/coaches'
  end
end
