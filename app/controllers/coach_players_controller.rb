class CoachPlayersController < ApplicationController
  def index
    if params[:alpha]
      @coach = Coach.find(params[:id])
      @players = @coach.players.order(:name)
    else
      @coach = Coach.find(params[:id])
      @players = @coach.players
    end

  end

end
