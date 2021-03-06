class ApplicationController < ActionController::Base
  helper_method :current_user, :format_date

  def current_path
    request.path
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def format_date(date)
    if date.respond_to?(:strftime)
      date.strftime('%B%e, %Y')
    else
      DateTime.parse(date).strftime('%B %e, %Y')
    end
  end
end
