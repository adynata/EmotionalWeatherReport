class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      rendirect_to forecast_url(@user.location)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.find(params[:user])
    render :edit
  end

  def update
    @user = User.find(params[:user])
    if @user.update(user_params)
      # you just do - view stays the same if it's a single page or a popped up form, right?
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user])
    @user.destroy
    redirect_to forecasts_url
  end

  private
  def user_params
    params.require(:user).permit(:location, :fname, :lname, :username)
  end

end
