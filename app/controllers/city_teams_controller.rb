class CityTeamsController < ApplicationController
  def index
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
    team = Team.create!(team_params)

      redirect_to "/cities/#{@city.id}/teams"
  end

  private
    def team_params
      result = {name: params[:name],
                roster_count: params[:roster_count],
                city_id: params[:city_id]
              }

      if params[:share_stadium] == 'on'
        result[:share_stadium] = true
      else
        result[:share_stadium] = false
      end
      result
    end
end
