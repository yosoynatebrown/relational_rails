class TeamsController < ApplicationController
  def index
    @teams = Team.where(share_stadium: true)
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

  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    redirect_to '/teams'
  end
end
