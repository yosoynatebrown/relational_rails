class TeamsController < ApplicationController
  def index
    @teams = Team.where(share_stadium: true)
  end

  def new
  end

  def show
    @team = Team.find(params[:id])
  end

  def create
    Team.create!(team_params)

    redirect_to '/teams'
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    redirect_to "/teams/#{@team.id}"
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    redirect_to '/teams'
  end

  private
    def team_params
      result = {name: params[:name],
                roster_count: params[:roster_count],
                city_id: params[:city_id]
              }

      if params[:share_stadium] == 'on'
        result[:share_stadium] = true
      else
        result[:share_stadium] = false
      end
      result
    end
end
