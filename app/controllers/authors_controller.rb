class AuthorsController < ApplicationController


	def index
		@authors = Author.paginate(page: params[:page], per_page: 5)
	end

	def show
		@author = Author.find(params[:id])
		@articles = @author.articles.paginate(page: params[:page], per_page: 5)
	end

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

	def edit 
		@author = Author.find(params[:id])
	end

	def update
		@author = Author.find(params[:id])
		if @author.update(user_params)
			flash[:notice] = "Successfully updated"
			redirect_to @author
		else
			render 'edit'
		end
	end



	private

	def user_params
		params.require(:author).permit(:authorname, :email, :password)
	end
end
