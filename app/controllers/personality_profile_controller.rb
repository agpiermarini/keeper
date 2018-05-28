class PersonalityProfileController < ApplicationController
  def show
    @personality_profile = PersonalityProfileSearch.new(params[:username]).profile
  end
end
