class FeelsController < ApplicationController
  def index
    @feels_tree = Feel.feels_tree
  end

  def new
    @feel = Feel.new
  end

  def create
    @feel = Feel.new(feels_params)
    if @feel.save!
      render json: "success"
    else
      flash.now[:errors] = @feel.errors.full_messages
      render json: "FAIL"
    end
  end

  private

  def feels_params
    params.require(:feel).permit(:feel, :user_id)
  end

end
