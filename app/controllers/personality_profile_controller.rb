class PersonalityProfileController < ApplicationController
  def show
    unless PersonalityProfile.where("created_at > NOW() - '6 HOURS'::Interval").find_by(username: params[:username])
      PersonalityProfileGenerator.new(params[:username]).generate!
    end
    @twitter_profile     =  TwitterProfileSearch.new(params[:username]).profile
    @personality_profile =  PersonalityProfile.where("created_at > NOW() - '6 HOURS'::Interval").find_by(username: params[:username])
  end
end
