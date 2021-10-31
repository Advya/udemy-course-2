class AuthorsController < ApplicationController

	def new
		@authors = Author.new
	end
end
