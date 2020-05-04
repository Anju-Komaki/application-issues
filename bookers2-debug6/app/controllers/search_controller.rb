class SearchController < ApplicationController
	def search
      if params[:search_method] == "Book"
        @books = Book.search(params[:search_way],params[:search])
      else
        @users = User.search(params[:search_way],params[:search])
      end
  end
end
