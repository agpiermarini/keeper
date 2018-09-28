class PersonalityProfileTextController < ApplicationController
  def new; end

  def show
    PersonalityProfileGenerator.new(nil).generate_from_text!
    @twitter_profile = TwitterProfileSearch.new(current_user.username).profile
  end
end
