class DashboardController < ApplicationController
  def show
    @profile = TwitterProfileSearch.new(current_user.username).profile
  end
end
