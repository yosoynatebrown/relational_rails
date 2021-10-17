class CityTeamsController < ApplicationController
  def index
    if params[:alpha]
      @city = City.find(params[:id])
      @teams = @city.teams.order(:name)
    else
      @city = City.find(params[:id])
      @teams = @city.teams
    end
  end

end
