class CitiesController < ApplicationController
  def index
    @cities = City.order_by_created_at
  end

  def new
  end

  def show
    @city = load_city(params[:id])
  end

  def create
    City.create!(city_params)

    redirect_to '/cities'
  end

  def edit
    @city = load_city(params[:id])
  end

  def update
    @city = load_city(params[:id])
    @city.update(city_params)

    redirect_to '/cities'
  end

  def destroy
    @city = load_city(params[:id])
    @city.destroy

    redirect_to '/cities'
  end

  private
    def city_params
      result = {name: params[:name],
                population: params[:population]
              }

      if params[:above_4000_feet] == 'on'
        result[:above_4000_feet] = true
      else
        result[:above_4000_feet] = false
      end
      result
    end

    def load_city(id)
      City.find(id)
    end
end
