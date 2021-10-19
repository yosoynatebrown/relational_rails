class CoachesController < ApplicationController
  def index
    @coaches = Coach.order(created_at: :desc)
  end

  def new
  end

  def show
    @coach = Coach.find(params[:id])
  end

  def create
    coach = Coach.create!(coach_params)


    redirect_to '/coaches'
  end

  def edit
    @coach = Coach.find(params[:id])
  end

  def update
    @coach = Coach.find(params[:id])
    @coach.update(coach_params)

    redirect_to '/coaches'
  end

  def destroy
    @coach = Coach.find(params[:id])
    @coach.destroy

    redirect_to '/coaches'
  end

  private
    def coach_params
      result = {name: params[:name],
                years_coaching: params[:years_coaching]
              }

      if params[:won_championship] == 'on'
        result[:won_championship] = true
      else
        result[:won_championship] = false
      end
      result
    end
end
