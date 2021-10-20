class CityTeamsController < ApplicationController
  def index
    if params[:alpha]
      @city = load_city(params[:id])
      @teams = @city.teams.order(:name)
    elsif params["Roster Size >"]
      @city = load_city(params[:id])
      @teams = @city.filter_by_roster_count(params["Roster Size >"])
    else
      @city = load_city(params[:id])
      @teams = @city.teams
    end
  end

  def new
    @city = load_city(params[:id])
  end

  def create
    @city = load_city(params[:id])
    Team.create!(team_params)

    redirect_to "/cities/#{@city.id}/teams"
  end

  private
    def team_params
      result = {name: params[:name],
                roster_count: params[:roster_count],
                city_id: params[:city_id]
              }

      if params[:share_stadium] == '1'
        result[:share_stadium] = true
      else
        result[:share_stadium] = false
      end
      result
    end

    def load_city(id)
      City.find(id)
    end
end
