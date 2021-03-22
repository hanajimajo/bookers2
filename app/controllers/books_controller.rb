class BooksController < ApplicationController

  def index
    @books = Book.all
    @user = current_user
  end

  def edit
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(@book.id)
  end

end
