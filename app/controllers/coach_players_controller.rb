class CoachPlayersController < ApplicationController
  def index
    # binding.pry
    @coach = Coach.find(params[:id])
    @players = @coach.players
  end

end
