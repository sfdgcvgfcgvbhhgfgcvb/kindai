class TweetsController < ApplicationController
  def index
   @tweets = Tweet.all #SELECT * FROM TWEET;
  end
  def new
   @tweet = Tweet.new
  end
  def create
   logger.debug "-------" + params[:tweet][:message] + "---------"
   @tweet = Tweet.new(message: params[:tweet][:message], tdate: Time.current)
    if @tweet.save
     flash[:notice] = ''
     redirect_to '/'
    else
     render 'new'
    end
  end
  def show
   @tweet = Tweet.find(params[:id])
  end
  def destroy
   tweet = Tweet.find(params[:id])
   tweet.destroy
   redirect_to '/'
  end
  def edit
    @tweet = Tweet.find(params[:id])
  end
  def update
    tweet = Tweet.find(params[:id])
    tweet.update(message: params[:tweet][:message])
    redirect_to '/'
  end
end