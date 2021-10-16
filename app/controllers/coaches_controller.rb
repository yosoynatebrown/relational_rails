class CoachesController < ApplicationController
  def index
    @coaches = Coach.order(created_at: :desc)
  end

  def new
  end

  def show
    @coach = Coach.find(params[:id])
  end

  def create
    coach = Coach.create!({
      name: params[:name],
      won_championship: params[:won_championship] == "1" ? true : false,
      years_coaching: params[:years_coaching].to_i
      })

    redirect_to '/coaches'
  end

  def edit
    @coach = Coach.find(params[:id])
  end

  def update
    @coach = Coach.find(params[:id])
    @coach.update(coach_params)

    redirect_to '/coaches'
  end

  private
  def coach_params
    params.permit(:name, :won_championship, :years_coaching)
  end
end
