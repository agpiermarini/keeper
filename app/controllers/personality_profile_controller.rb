class PersonalityProfileController < ApplicationController
  def show
    @profile              = TwitterProfileSearch.new(params[:username]).profile
    @timeline             = TwitterTimelineSearch.new(params[:username])
    @personality_insights = PersonalityInsightsSearch.new(params[:username], @timeline.to_string).profile
  end
end
