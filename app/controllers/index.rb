get '/' do
  erb :index
end

post '/' do
  @user = TwitterUser.find_or_create_by_username(params[:username].downcase)

  if @user.tweets.empty? || @user.tweets_stale?
    @user.fetch_tweets!
    @tweets = @user.tweets.order("tweet_time DESC").limit(20)
    erb :_showtweets, :layout => false
  else
    @tweets = @user.tweets.order("tweet_time DESC").limit(20)
    erb :_showtweets, :layout => false
  end
end
