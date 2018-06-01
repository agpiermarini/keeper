class PersonalityProfileController < ApplicationController
  def show
    @personality_profile = PersonalityProfilePresenter.new(params[:username])
  end
end
