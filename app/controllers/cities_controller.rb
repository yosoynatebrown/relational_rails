class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def new
  end

  def show
    @city = City.find(params[:id])
  end

  def create
    city = City.new({
      name: params[:city][:name],
      above_4000_feet: params[:city][:above_4000_feet] == "on" ? true : false,
      population: params[:city][:population].to_i
      })

      city.save

      redirect_to '/cities'
  end
end
