class TweetsController < ApplicationController

  before_filter :authorize

  def authorize
    unless session[:user_id]
      redirect_to login_path
    end
  end
  # GET /tweets
  # GET /tweets.json

  expose(:tweet) { Tweet.new }
  expose(:tweets) {
    Tweet.timeline_for(current_user.me_and_followings).paginate(page: params[:page], per_page: 100).order('created_at desc')
  }
  def index
    Stat.add(request)
    
    unless params[:tweet_id].nil?
      @quote = Tweet.find(params[:tweet_id])
      @tweet = Tweet.new
      @tweet.content = "\"@#{@quote.user.name}: #{@quote.content}\""
      self.tweet = @tweet
    end
  end

  def get_user_from
    request.env["HTTP_REFERER"]
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
      @tweet.retweets.destroy_all

      @tweet.destroy
    else
      flash[:notice] = "Tweet can not be deleted"
    end

    respond_to do |format|
      format.html { redirect_to tweets_url }
      format.json { head :no_content }
    end    
  end

  def retweet
    original_tweet = Tweet.find(params[:id])
    original_tweet.retweet(current_user)

    flash[:notice] = "Retweeted"
    redirect_to :root
  end

  def favorite
    tweet = Tweet.find params[:id]
    current_user.favorite_tweets << tweet
    flash[:notice] = "Favorited"
    redirect_to :root
    
  end

  def unfavorite
    tweet = Tweet.find params[:id]
    tweet.favorite_users.delete current_user
    flash[:notice] = "unfavorited!"
    redirect_to :back
  end

  def popluar_tweets
    @tweets = Tweet.find_many_retweets
  end

  def find
     @search_tweets = Tweet.search(params[:search])
     render action: "index"
  end
end