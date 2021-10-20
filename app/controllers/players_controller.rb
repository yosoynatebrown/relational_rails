class PlayersController < ApplicationController
  def index
    @players = Player.only_mvps
  end

  def new
  end

  def show
    @player = load_player(params[:id])
  end

  def edit
    @player = load_player(params[:id])
  end

  def update
    @player = load_player(params[:id])
    @player.update(player_params)

    redirect_to "/players/#{@player.id}"
  end

  def destroy
    @player = load_player(params[:id])
    @player.destroy

    redirect_to '/players'
  end

  private

    def player_params
      result = {name: params[:name],
                career_total_points: params[:career_total_points],
                coach_id: params[:coach_id]
              }
      if params[:MVP] == '1'
        result[:MVP] = true
      else
        result[:MVP] = false
      end
      result
    end

    def load_player(id)
      Player.find(id)
    end
end
