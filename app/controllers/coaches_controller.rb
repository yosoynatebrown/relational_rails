class CoachesController < ApplicationController
  def index
    @coaches = Coach.order_by_created_at
  end

  def new
  end

  def show
    @coach = load_coach(params[:id])
  end

  def create
    Coach.create!(coach_params)

    redirect_to '/coaches'
  end

  def edit
    @coach = load_coach(params[:id])
  end

  def update
    coach = load_coach(params[:id])
    coach.update(coach_params)

    redirect_to '/coaches'
  end

  def destroy
    @coach = load_coach(params[:id])
    @coach.destroy

    redirect_to '/coaches'
  end

  private
    def coach_params
      result = {name: params[:name],
                years_coaching: params[:years_coaching]
              }

      if params[:won_championship] == '1'
        result[:won_championship] = true
      else
        result[:won_championship] = false
      end
      result
    end

    def load_coach(id)
      Coach.find(id)
    end
end
