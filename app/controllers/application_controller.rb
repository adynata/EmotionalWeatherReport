class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  before_filter :ensure_signup_complete, only: [:new, :create, :update, :destroy]
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  helper :friendships

  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end

  def show_me_feelings
    @feelings = Feel.feels_tree
  end

  def show_me_friends
  end

  def index
  end

  protected

  def configure_devise_permitted_parameters
    registration_params = [:location, :fname, :lname, :email, :name, :password, :password_confirmation]

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
