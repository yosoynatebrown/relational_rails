class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def new
  end

  def show
    @player = Player.find(params[:id])
  end

  def create
    player = Player.new({
      name: params[:player][:name],
      above_4000_feet: params[:player][:above_4000_feet] == "on" ? true : false,
      population: params[:player][:population].to_i
      })

      player.save

      redirect_to '/players'
  end
end
