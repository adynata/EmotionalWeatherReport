class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {"response"=>"success", "first_name"=>@user.fname }
    else
      flash.now[:errors] = @user.errors.full_messages
      render json: :new
    end
  end

  def friends_timeline
    @friends = User.friends
    friends_array = []
    @friends.each do |friend|
      friend_hash = {}
      friend_hash["name"] = friend.name
      feels = friend.feels
      feels
    end
  end

  #
  # def update
  #   @user = User.find(params[:user])
  #   if @user.update(user_params)
  #     # you just do - view stays the same if it's a single page or a popped up form, right?
  #   else
  #     flash.now[:errors] = @user.errors.full_messages
  #     render :edit
  #   end
  # end

  def update
    # authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        sign_in(@user == current_user ? @user : current_user, :bypass => true)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # controller methods from the tutorial page:
  #
  # ...
  #
  # # GET /users/:id.:format
  def show
    # authorize! :read, @user
    @user = User.find(params[:user])
    @friends = @user.friends
    @feels = @user.feels
  end




  #
  # # GET /users/:id/edit
  # def edit
  #   # authorize! :update, @user
  # end

  # PATCH/PUT /users/:id.:format

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  # DELETE /users/:id.:format
  def destroy
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end



    def user_params
      accessible = [ :name, :email, :location, :fname, :lname ] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end

end
