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
    team = Team.new({
      name: params[:team][:name],
      above_4000_feet: params[:team][:above_4000_feet] == "on" ? true : false,
      population: params[:team][:population].to_i
      })

      team.save

      redirect_to '/teams'
  end
end
