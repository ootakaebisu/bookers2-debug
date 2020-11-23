class BookCommentsController < ApplicationController

  def create
    # @book = Book.find(params[:book_id])
    # comment = current_user.book_comments.new(book_comment_params)
    # comment.book_id = @book.id
    # comment.save
    # redirect_to book_path(book)


    @book = Book.find(params[:book_id])
    #投稿に紐づいたコメントを作成
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    @book_comment.save
    # 「app/views/book_comments/comment.js.erb」を探す
    @book_comments = @book.book_comments
    # render :comment
  end

  def destroy
    # @book = Book.find(params[:book_id])
    # BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    # redirect_to book_path(params[:book_id])


    @book = Book.find(params[:book_id])
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
     # 「app/views/book_comments/comment.js.erb」を探す
    # render :comment
  end

  private

    def book_comment_params
      params.require(:book_comment).permit(:comment, :book_id, :user_id)
    end

end
