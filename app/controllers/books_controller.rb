class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
  	@books = Book.all
  	@book = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @books = Book.find(params[:id])
    @book = Book.new
    @user = @books.user
    @book_comment = BookComment.new
    @book_comments = @books.book_comments
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
    if @book.save
      flash[:create] = 'You have creatad book successfully.'
  		redirect_to book_path(@book.id)
    else
      @user = User.find_by(id: current_user.id)
      @books = Book.all
      render "books/index"
  	end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id
    redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:update] = 'You have updated book successfully'
    redirect_to book_path(@book)
    else
      render "books/edit"
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
end
