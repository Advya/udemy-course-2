class ApplicationController < ActionController::Base
	helper_method :current_author

	def current_author
		@current_author ||= Author.find(session[:user_id]) if session[:usesr_id]
	end

	def require_author
		
	end
end
