class CitiesController < ApplicationController
  def index
    @cities = City.order(created_at: :desc)
  end

  def new
  end

  def show
    @city = City.find(params[:id])
  end

  def create
    city = City.create!({
      name: params[:name],
      above_4000_feet: params[:above_4000_feet] == "on" ? true : false,
      population: params[:population].to_i
      })

      redirect_to '/cities'
  end
end
