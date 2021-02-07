class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  def create
    @user = current_user
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully Done"
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end
  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
    else
      redirect_to books_path
    end
  end
  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = current_user
    @book_comment = BookComment.new
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully Done"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
