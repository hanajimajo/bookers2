class UsersController < ApplicationController

   before_action :ensure_correct_user, only: [:edit]

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def new
    flash[:notice] = "Welcome! You have signed up successfully."
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.all
  end

  def edit
     flash[:notice] = "You have updated user successfully."
     @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render '/users/edit'
    end
  end

  def create
    flash[:notice]
    redirect_to user_path(@user.id)
  end

  def destroy
    flash[:notice] = "Signed out successfully."
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :title, :body, :introduction)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless  current_user.id == @user.id
       redirect_to user_path(current_user)
    end
  end

end
