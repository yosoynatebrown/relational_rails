class CityTeamsController < ApplicationController
  def index
    @city = City.find(params[:id])
    @teams = @city.teams
  end

  def new
    @city = City.find(params[:id])
  end

  def create
    @city = City.find(params[:id])
    team = Team.create!({
      name: params[:name],
      share_stadium: params[:share_stadium] == "1" ? true : false,
      roster_count: params[:roster_count].to_i,
      city_id: params[:city_id]
      })

      redirect_to "/cities/#{@city.id}/teams"
  end
end
