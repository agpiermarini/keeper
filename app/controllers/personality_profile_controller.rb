class PersonalityProfileController < ApplicationController
  def show
    unless PersonalityProfile.find_by(username: params[:username], created_at: Date.today)
      PersonalityProfileGenerator.new(params[:username]).generate!
    end
    @twitter_profile     =  TwitterProfileSearch.new(params[:username]).profile
    @personality_profile =  PersonalityProfile.find_by(username: params[:username], created_at: Date.today)
  end
end
