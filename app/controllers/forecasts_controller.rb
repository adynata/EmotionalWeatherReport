class ForecastsController < ApplicationController


  def new
    @forecast = Forecast.new
  end

  def create
    @forecast = Forecast.new(forecast_params)
    if @forecast.save
      render json: @forecast
    else
      flash.now[:errors] = @forecast.errors.full_messages
    end
  end

  def index
    @forecast = Forecast.new
    render json: @forecast
  end

  private
  def forecast_params
    params.require(:forecast).permit(:zipcode)
  end


end
