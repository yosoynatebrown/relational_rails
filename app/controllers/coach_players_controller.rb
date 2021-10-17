class CoachPlayersController < ApplicationController
  def index

    @coach = Coach.find(params[:id])
    @players = @coach.players
  end

  def new
    @coach = Coach.find(params[:id])
  end

  def create
    @coach = Coach.find(params[:id])
    player = Player.create!({
      name: params[:name],
      MVP: params[:MVP] == "1" ? true : false,
      career_total_points: params[:career_total_points].to_i,
      coach_id: params[:coach_id]
      })

      redirect_to "/coaches/#{@coach.id}/players"
  end

end
