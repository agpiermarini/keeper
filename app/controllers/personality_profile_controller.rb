class PersonalityProfileController < ApplicationController
  # def create
  #   unless PersonalityProfile.find_by(username: params[:username])
  #     PersonalityProfileGenerator.new(params[:username]).generate!
  #   end
  #   redirect_to "/#{params[:username]}/personality-profile"
  #   end
  # end

  def show
    unless PersonalityProfile.find_by(username: params[:username])
      PersonalityProfileGenerator.new(params[:username]).generate!
    end
    @personality_profile = PersonalityProfilePresenter.new(params[:username])
  end
end
