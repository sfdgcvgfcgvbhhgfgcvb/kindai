class TweetsController < ApplicationController
  def index
   @tweets = Tweet.all #SELECT * FROM TWEET;
  end
  def new
   @tweet = Tweet.new
  end
  def create
   @tweet = Tweet.new(message: params[:tweet][:message], tdate: Time.current)
    if @tweet.save
     flash[:notice] = '1レコード追加しました'
     redirect_to :root
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
   redirect_to :root
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