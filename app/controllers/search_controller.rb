class SearchController < ApplicationController
  def show
    redirect_to "/#{params[:username]}"
  end
end
