class SearchController < ApplicationController
  def show
    if params[:username_query]
      @results = TwitterUserSearch.new(current_user, params[:username_query])
    end
  end
end
