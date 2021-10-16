class CoachPlayersController < ApplicationController
  def index
  
    @coach = Coach.find(params[:id])
    @players = @coach.players
  end

end
