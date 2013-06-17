get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/' do
  start_time = Time.now
  @user = TwitterUser.find_or_create_by_username(params[:username])


  if @user.tweets.empty?
    @user.fetch_tweets!
  end

  if @user.tweets_stale?
    @user.fetch_tweets!
  end

  @tweets = @user.tweets.order("tweet_time DESC").limit(20)
  end_time = Time.now - start_time
  puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX #{end_time} XXXXXXXXXXXXX"
  erb :showtweets

end
