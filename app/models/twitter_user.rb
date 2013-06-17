class TwitterUser < ActiveRecord::Base
  has_many :tweets
  # Remember to create a migration!

  def fetch_tweets!
    Twitter.user_timeline(self.username).each do |tweet|
      self.tweets << Tweet.find_or_create_by_text(text: tweet.text, tweet_time: tweet.created_at)
    end  
  end

  def tweets_stale?
    Time.now - self.tweets.last.updated_at >= 900 ? true : false
  end
end
