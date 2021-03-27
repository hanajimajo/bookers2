class BooksController < ApplicationController

 before_action :ensure_correct_user, only: [:edit]

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = current_user
    @books = Book.all

  end

  def new
    @book = Book.new
    @books = Book.all
  end

  def create
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
    redirect_to book_path(@book)
    flash[:notice] = "Book was successfully created."
   else
    render '/books/index'
   end
  end

  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
    redirect_to book_path(@book)
    flash[:notice] = "You have updated book successfully."
   else
    render '/books/edit'
   end
  end

  def destroy
   @book = Book.find(params[:id])
   @book.destroy
   redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    unless  current_user.id == @book.user.id
      redirect_to books_path
    end
  end

end
