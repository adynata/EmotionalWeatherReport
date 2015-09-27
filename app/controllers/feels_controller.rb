class FeelsController < ApplicationController

  def new
  end

  def log
    render json: Feels.feels_tree
  end

end
