class ProfilesController < ApplicationController
  def show
    @profile = ProfileSearch.new(params[:username])
  end
end
