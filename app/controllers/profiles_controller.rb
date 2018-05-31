class ProfilesController < ApplicationController
  def show
    @profile = TwitterProfileSearch.new(params[:username]).profile
  end
end
