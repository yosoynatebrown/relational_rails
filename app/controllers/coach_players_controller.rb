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
    Player.create!(player_params)

    redirect_to "/coaches/#{@coach.id}/players"
  end

  private
    def player_params
      result = {name: params[:name],
                career_total_points: params[:career_total_points],
                coach_id: params[:coach_id]
              }

      if params[:MVP] == 'on'
        result[:MVP] = true
      else
        result[:MVP] = false
      end
      result
    end
end
