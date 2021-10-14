class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
  end

  def show
    @team = Team.find(params[:id])
  end

  def create
    team = Team.create!({
      name: params[:team][:name],
      share_stadium: params[:team][:share_stadium] == "on" ? true : false,
      roster_count: params[:team][:roster_count].to_i
      })

      binding.pry
      redirect_to '/teams'
  end
end
