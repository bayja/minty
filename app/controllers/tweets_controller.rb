class TweetsController < ApplicationController

  before_filter :authorize

  def authorize
    unless session[:user_id]
      redirect_to login_path
    end
  end
  # GET /tweets
  # GET /tweets.json
  def index
    @user = User.find(session[:user_id])
    @tweet = Tweet.new
    @tweets = Tweet.paginate page: params[:page], order:'created_at desc', per_page: 10

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tweets }
    end
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tweet }
    end
  end

  # GET /tweets/new
  # GET /tweets/new.json
  def new
    @tweet = Tweet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tweet }
    end
  end

  # GET /tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(params[:tweet])
    @user = User.find(session[:user_id])
    @tweet.user = @user

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweets_url, notice: 'Tweet was successfully created.' }
        format.json { render json: @tweet, status: :created, location: @tweet }
      else
        @tweets = Tweet.paginate page: params[:page], order:'created_at desc', per_page: 10
        @user = User.new
        format.html { render action: "index" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tweets/1
  # PUT /tweets/1.json
  def update
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      if @tweet.update_attributes(params[:tweet])
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet = Tweet.find(params[:id])

    if @tweet.user_id  == session[:user_id]
      @tweet.destroy
    else
      flash[:notice] = "Tweet Can not be Delete"
    end

    respond_to do |format|
      format.html { redirect_to tweets_url }
      format.json { head :no_content }
    end    
  end
end
