class CoachPlayersController < ApplicationController
  def index
    if params[:alpha]
      @coach = Coach.find(params[:id])
      @players = @coach.players.order(:name)
    elsif params["Career Total Points >"]
      @coach = Coach.find(params[:id])
      @players = @coach.filter_by_career_total_points(params["Career Total Points >"])
    else
      @coach = Coach.find(params[:id])
      @players = @coach.players
    end
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

  private
  def coach_params
    params.permit(:name, :won_championship, :years_coaching)
  end

  def player_params
    params.permit(:name, :MVP, :years_coaching)
  end
end
