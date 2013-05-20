class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorization
  before_filter :authorization_admin

  protected
  
  def authorization
	unless Team.find_by_id(session[:team_id])
		redirect_to login_url, notice: "Try again"
	end
  end
  
    def authorization_admin
	unless session[:admin]
		redirect_to login_url, notice: "Nice try"
	end
  end
  
end
