class BookCommentsController < ApplicationController

	def create
		@book = Book.find(params[:book_id])
		@book_comment = current_user.book_comments.build(book_comment_params)
		@book_comment.book_id = @book.id
		@book_comment.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@book = Book.find(params[:book_id])
		@book_comment = current_user.book_comments.find_by(id: params[:id], book_id: @book.id)
		@book_comment.destroy
		redirect_back(fallback_location: root_path)
	end

	private
	def book_comment_params
		params.permit(:comment)
	end

end
