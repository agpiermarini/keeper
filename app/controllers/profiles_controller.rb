class ProfilesController < ApplicationController
  def show
    @profile = TwitterUserSearch.new(params[:username]).profile
  end
end
