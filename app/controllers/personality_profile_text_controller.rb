class PersonalityProfileTextController < ApplicationController
  def new; end

  def show
    new_profile_id = PersonalityProfileGenerator.new(nil, profile_params).from_text!
    @personality_profile = PersonalityProfile.find(new_profile_id)
  end

  private
    def profile_params
      params.permit(:name, :source, :text)
    end
end
