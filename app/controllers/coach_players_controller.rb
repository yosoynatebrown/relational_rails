class CoachPlayersController < ApplicationController
  def index
    if params[:alpha]
      @coach = load_coach(params[:id])
      @players = @coach.players.order(:name)
    elsif params["Career Total Points >"]
      @coach = load_coach(params[:id])
      @players = @coach.filter_by_career_total_points(params["Career Total Points >"])
    else
      @coach = load_coach(params[:id])
      @players = @coach.players
    end
  end

  def new
    @coach = load_coach(params[:id])
  end

  def create
    @coach = load_coach(params[:id])
    Player.create!(player_params)

    redirect_to "/coaches/#{@coach.id}/players"
  end

  private

    def player_params
      result = {name: params[:name],
                career_total_points: params[:career_total_points],
                coach_id: params[:coach_id]
              }
              require "pry"; binding.pry
      if params[:MVP] == '1'
        result[:MVP] = true
      else
        result[:MVP] = false
      end
      result
    end

    def load_coach(id)
      Coach.find(id)
    end
end
