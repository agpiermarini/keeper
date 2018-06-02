class TwitterTimelineSearch
  def initialize(username)
    @username = username
  end

  def total_tweets
    user_timeline.count
  end

  def newest_tweet
    total_tweets > 0 ? format_date(user_timeline.first[:date]) : "N/A"
  end

  def oldest_tweet
    total_tweets > 0 ? format_date(user_timeline.last[:date]) : "N/A"
  end

  def to_string
    user_timeline.map { | tweet | tweet[:text] }.join(" ")
  end

  private
    attr_reader :username

    def timeline_endpoint
      "/statuses/user_timeline.json"
    end

    def timeline_params
      {screen_name: username,
       include_rts: false,
       exclude_replies: true,
       trim_user: true,
       count: 200
      }
    end

    def fetch_tweets(tweets = [], params = timeline_params)
      statuses = twitter_service(timeline_endpoint, params).response
      return tweets if statuses.empty?
      params[:max_id] = statuses.last[:id] - 1
      new_tweets = generate_hash(statuses)
      fetch_tweets(tweets.append(new_tweets).flatten, params)
    end

    def generate_hash(statuses)
      statuses.map do | status |
        {date: status[:created_at], text: status[:text]}
      end
    end

    def user_timeline
      @user_timeline ||= fetch_tweets
    end

    def format_date(date)
      DateTime.parse(date).strftime('%B %e, %Y')
    end

    def twitter_service(endpoint, params)
      TwitterService.new(endpoint, params)
    end
  end
