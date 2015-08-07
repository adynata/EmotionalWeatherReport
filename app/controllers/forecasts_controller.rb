class ForecastsController < ApplicationController


  def new
    @forecast = Forecast.new
  end

  def create
    @forecast = Forecast.new(forecast_params)
    if @forecast.save
      redirect to forecast_url(@forecast)
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
