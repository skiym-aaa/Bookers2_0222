class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
      @user = User.all
      @book = Book.new
  end

  def show
      @user = User.find(params[:id])
      @book = Book.new
      # ページャ実装？
      @books = @user.books.reverse_order
  end

  def edit
  end

  def update
  end

  private
  def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
