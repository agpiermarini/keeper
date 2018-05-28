class TwitterTimelineSearch
  def initialize(username)
    @username = username
  end

  def user_timeline(tweets = [], params = timeline_params)
    statuses = twitter_service(timeline_endpoint, params).response
    return tweets if statuses.empty?
    params[:max_id] = statuses.last[:id] - 1

    new_tweets = statuses.map do | status |
      {date: status[:created_at], text: status[:text]}
    end

    user_timeline(tweets.append(new_tweets).flatten, params)
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

    def twitter_service(endpoint, params)
      TwitterService.new(endpoint, params)
    end
  end
