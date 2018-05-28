class PersonalityProfileController < ApplicationController
  def show
    timeline_query       = TwitterTimelineSearch.new(params[:username])
    @status_timeline     = timeline_query.user_timeline
    @personality_insights = PersonalityInsightsSearch.new(params[:username], timeline_query.to_string)
  end
end
