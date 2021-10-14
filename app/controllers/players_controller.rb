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
    player = Player.create!({
      name: params[:player][:name],
      MVP: params[:player][:MVP] == "on" ? true : false,
      career_total_points: params[:player][:career_total_points].to_i
      })

      redirect_to '/players'
  end
end
