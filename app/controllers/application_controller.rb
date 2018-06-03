class ApplicationController < ActionController::Base
  helper_method :current_user, :format_date

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def format_date(date)
    DateTime.parse(date).strftime('%B %e, %Y')
  end
end
