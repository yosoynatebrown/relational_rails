class TeamsController < ApplicationController
  def index
    @teams = Team.only_share_stadiums
  end

  def new
  end

  def show
    @team = load_team(params[:id])
  end

  def edit
    @team = load_team(params[:id])
  end

  def update
    @team = load_team(params[:id])
    @team.update(team_params)
    redirect_to "/teams/#{@team.id}"
  end

  def destroy
    @team = load_team(params[:id])
    @team.destroy

    redirect_to '/teams'
  end

  private
    def team_params
      result = {name: params[:name],
                roster_count: params[:roster_count],
                city_id: params[:city_id]
              }

      if params[:share_stadium] == '1'
        result[:share_stadium] = true
      else
        result[:share_stadium] = false
      end
      result
    end

    def load_team(id)
      Team.find(id)
    end
end
