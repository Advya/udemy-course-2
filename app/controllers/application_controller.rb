class ApplicationController < ActionController::Base

	helper_method :current_author, :logged_in?

	def current_author
		@current_author ||= Author.find(session[:author_id]) if session[:author_id]
	end

	def logged_in?
		!!current_author
	end

	def require_author
		if !logged_in?
	      flash[:alert] = "You must be logged in to perform that action"
	      redirect_to login_path
	    end
	end
	
end
