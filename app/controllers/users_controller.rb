class UsersController < ApplicationController
  # GET /users
  # GET /users.json

  before_filter :authorize, only: [:edit, :update]

  def authorize
    @user = User.find(params[:id])

    unless current_user == @user or current_user.admin?
      flash[:notice] = "You are not allowed"
      redirect_to :root
    end
  end

  expose(:users)
  expose(:user)

  # POST /users
  # POST /users.json
  def create
    # @user = User.new(params[:user])

    respond_to do |format|
      if user.save
        session[:user_id] = user.id
        format.html { redirect_to :root, notice: 'User was successfully created.' }
        format.json { render json: user, status: :created, location: user }
      else
        format.html { render action: "new", notice: '#{@user} fail to create.' }
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])

    if @user == current_user
      @user.destroy
    else
      flash[:notice] = "You are not allowed"
    end

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def follow
    user = User.find(session[:user_id])
    following = User.find(params[:id])
    
    begin
      user.followings << following
      user.save!
    rescue ActiveRecord::RecordNotUnique
      flash[:notice] = "You are already following #{following.name}"
    rescue ActiveRecord::RecordInvalid
      flash[:notice] = "You cannot follow yourself"
      user.followings.delete following
    else
      flash[:notice] = "You are now following #{following.name}"
    end

    redirect_to :root
  end

  def unfollow
    user = User.find(session[:user_id])
    user_to_unfollow = User.find(params[:id])

    user.followings.delete(user_to_unfollow)

    flash[:notice] = "You are now unfollowing #{user_to_unfollow.name}"
    redirect_to :root
  end

  def favorites
    @user = User.find(params[:id])

    @favorites = @user.favorite_tweets.paginate(page: params[:page], per_page: 100).order('created_at desc')
  end

  def find
  end
end
