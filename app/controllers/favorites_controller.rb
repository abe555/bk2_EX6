class FavoritesController < ApplicationController
	before_action :authenticate_user!

	def create
		book = Book.find(params[:book_id])
		favorite = current_user.favorites.build(book_id: params[:book_id])
		favorite.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		book = Book.find(params[:book_id])
		favorite = current_user.favorites.find_by(book_id: params[:book_id])
		favorite.destroy
		redirect_back(fallback_location: root_path)
	end

end
