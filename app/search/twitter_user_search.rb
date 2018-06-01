class TwitterUserSearch
  def initialize(current_user, username_query)
    @current_user = current_user
    @username_query = username_query
  end

  def results
    client.user_search(username_query)
  end

  private
    attr_reader :current_user, :username_query

    def client
      @client ||= Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['twitter_api_key']
        config.consumer_secret     = ENV['twitter_secret']
        config.access_token        = current_user.oauth_token
        config.access_token_secret = current_user.oauth_secret
      end
    end
end
