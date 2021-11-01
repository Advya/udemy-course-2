class ApplicationController < ActionController::Base
	helper_method :current_author

	def current_author
		@current_author ||= Author.find(session[:author_id]) if session[:author_id]
	end

	def require_author

	end
end
