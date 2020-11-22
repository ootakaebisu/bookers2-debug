class FavoritesController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save

    # # 同じベージに遷移するパス指定・相対的
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @book = Book.find(params[:book_id])
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy

    # 同じベージに遷移するパス指定・相対的
    # redirect_back(fallback_location: root_path)
  end

end
