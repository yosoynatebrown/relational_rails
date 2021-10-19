class PlayersController < ApplicationController
  def index
    @players = Player.where(MVP: true)
  end

  def new
  end

  def show
    @player = Player.find(params[:id])
  end

  def create
      Player.create!(player_params)

      redirect_to '/players'
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    @player.update(player_params)

    redirect_to "/players/#{@player.id}"
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    redirect_to '/players'
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
