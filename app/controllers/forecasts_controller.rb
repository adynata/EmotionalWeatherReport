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
      render :new
    end
  end

  def index
    if current_user
      @forecast = Forecast.new({"zipcode" => current_user.location})
      render json: {"forecast" => @forecast, "user" => current_user}
    else
      @forecast = Forecast.new
      render json: @forecast
    end
  end

  private

  def forecast_params
    params.require(:forecast).permit(:zipcode)
  end


end
