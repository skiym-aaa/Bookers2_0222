class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
      @user= User.all
      @book= Book.new
      @books= Book.all
  end

  def create
      @book = Book.new(book_params)
      if @book.save
        # 投稿に成功した場合
        flash[:notice] = 'You have created book successfully.'
        redirect_to book_path(@book.id)
      else
        @books = Book.all
        render :index
      end
  end

  def show
      @user = User.find(params[:id])
      @book = Book.new
      @book = Book.find(params[:id])
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        # 編集に成功した場合
        flash[:notice] = 'You have updated book successfully.'
        redirect_to book_path(@book.id)
      else
        render :edit
      end
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
  end
  # 投稿データのストロングパラメータ
  private
    def book_params
        params.require(:book).permit(:title, :body, :user_id,)
    end
end
