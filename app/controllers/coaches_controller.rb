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
    # require "pry"; binding.pry
    coach = Coach.create!({
      name: params[:name],
      won_championship: params[:won_championship] == "1" ? true : false,
      years_coaching: params[:years_coaching].to_i
      })

      redirect_to '/coaches'
  end
end
