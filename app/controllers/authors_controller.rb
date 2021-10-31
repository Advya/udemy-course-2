class AuthorsController < ApplicationController

	def new
		@author = Author.new
	end

	def create
		@author = Author.new(user_params)
		if @author.save
			flash[:notice] = "Welcome #{ @author.authorname } to the Alpha blog!"
			redirect_to articles_path
		else
			render 'new'
		end
	end



	private

	def user_params
		params.require(:author).permit(:authorname, :email, :password)
	end
end
