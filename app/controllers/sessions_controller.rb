class SessionsController < ApplicationController
  skip_before_filter :authorization
  skip_before_filter :authorization_admin
  def new
  	session[:team_id] = nil
	session[:admin] = nil
  end

  def create
	team = Team.find_by_login(params[:login])
	if team and team.authenticate(params[:password])
		session[:team_id] = team.id
		if team.is_admin
			session[:admin] = true
			redirect_to root_path
		else
			session[:admin] = false
			redirect_to root_path
		end
	else
		redirect_to login_url, alert: "Try again"
    end		
  end

  def destroy
	session[:team_id] = nil
	session[:admin] = nil
	redirect_to login_url
  end
end
