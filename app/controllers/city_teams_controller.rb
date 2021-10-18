class CityTeamsController < ApplicationController
  def index
    # binding.pry
    if params[:alpha]
      @city = City.find(params[:id])
      @teams = @city.teams.order(:name)
    elsif params["Roster Size >"]
      @city = City.find(params[:id])
      @teams = @city.filter_by_roster_count(params["Roster Size >"])
    else
      @city = City.find(params[:id])
      @teams = @city.teams
    end
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
