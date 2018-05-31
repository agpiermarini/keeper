class DashboardController < ApplicationController
  def show
    @profile = TwitterUserSearch.new(current_user.username).profile
  end
end
