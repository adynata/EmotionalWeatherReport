class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  before_filter :ensure_signup_complete, only: [:new, :create, :update, :destroy]
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  before_filter :give_me_the_weather
  helper :friendships
  helper_method :is_signed_in?

  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end

  def give_me_the_weather
    @forecast = Forecast.new
    @forecast.get_forecast
  end

  def show_me_feelings
    @feelings = Feel.feels_tree
  end

  def index
    @location_path = "/#{params[:path]}"
  end

  def show_me_friends
    @user = User.find_by_id(current_user.params[:id])
  end

  def give_me_the_weather
    @forecast = Forecast.new
  end

  # def feeling_colors
  #   render json: Feel.colorize
  # end

  def is_signed_in?
    if user_signed_in?
      render json: {"signed_in" => true, "user" => current_user}
    else
      render json: {"signed_in" => false}
    end
  end


  protected

  def configure_devise_permitted_parameters
    registration_params = [:location, :email, :password]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) {
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(registration_params)
      }
    end
  end
end
