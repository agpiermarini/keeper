class PersonalityProfileTextController < ApplicationController
  def new; end

  def show
    PersonalityProfileGenerator.new(nil, profile_params).from_text!
    @twitter_profile = TwitterProfileSearch.new(current_user.username).profile
  end

  private
    def profile_params
      params.permit(:name, :source, :text)
    end
end
