class ForecastsController < ApplicationController


  def new
    @forecast = Forecast.new
  end

  def create
    @forecast = Forecast.new(forecast_params)
    if @forecast.save
      render :show
    else
      flash.now[:errors] = @forecast.errors.full_messages
      render :new
    end
  end

  def index
    @forecast = Forecast.new
    @forecast.get_forecast
  end

  private
  def forecast_params
    params.require(:forecast).permit(:zipcode)
  end


end
