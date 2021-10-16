class CityTeamsController < ApplicationController
  def index
    @city = City.find(params[:id])
    @teams = @city.teams
  end

end
