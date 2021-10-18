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
    player = Player.create!({
      name: params[:player][:name],
      MVP: params[:player][:MVP] == "on" ? true : false,
      career_total_points: params[:player][:career_total_points].to_i
      })

      redirect_to '/players'
  end


    def edit
      require "pry"; binding.pry
      @coach = Coach.find(params[:id])
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
end
