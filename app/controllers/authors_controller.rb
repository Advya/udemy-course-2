class AuthorsController < ApplicationController
	before_action :set_author, only: [:show, :edit, :update, :destroy]
	before_action :require_author, only: [:edit, :update]
	before_action :require_same_author, only: [:edit, :update, :destroy]

	def index
		@authors = Author.paginate(page: params[:page], per_page: 5)
	end

	def show		
		@articles = @author.articles.paginate(page: params[:page], per_page: 5)
	end

	def new
		@author = Author.new
	end

	def create
		@author = Author.new(user_params)
		if @author.save
			session[:author_id] = @author.id
			flash[:notice] = "Welcome #{ @author.authorname } to the Alpha blog!"
			redirect_to articles_path
		else
			render 'new'
		end
	end

	def edit 		
	end

	def update		
		if @author.update(user_params)
			flash[:notice] = "Successfully updated"
			redirect_to @author
		else
			render 'edit'
		end
	end

	def destroy 
		@author.destroy
		session[:author_id] = nil if @author == current_author
		flash[:notice] = "Account and it's articles successfully deleted!"
		redirect_to articles_path
	end



	private

	def user_params
		params.require(:author).permit(:authorname, :email, :password)
	end

	def set_author
		@author = Author.find(params[:id])
	end

	def require_same_author
		if current_author != @author && !current_author.admin?
			flash[:alert] = "You can only edit or delete your own acc"
			redirect_to @author
		end
	end

end
