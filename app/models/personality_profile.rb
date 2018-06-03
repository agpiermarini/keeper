class PersonalityProfile < ApplicationRecord
  has_many :dimensions
  has_many :facets, through: :dimensions
  has_many :needs
  has_many :values
  has_many :facets

  def oldest_tweet
    format_date(self.oldest_tweet_analyzed_date)
  end

  def newest_tweet
    format_date(self.newest_tweet_analyzed_date)
  end

  private
    def format_date(date)
      DateTime.parse(date).strftime('%B %e, %Y')
    end
end
