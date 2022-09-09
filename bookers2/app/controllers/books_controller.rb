class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all.page(params[:page]).per(4)
      @user = User
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
   if @book.save
     flash[:notice] = "You have updated book successfully."
     redirect_to book_path(@book.id)
   else
     render :edit;
   end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end

  def index
    @book = Book.new
    @books = Book.all.page(params[:page]).per(4)
    @user = User
  end

  def show

    @book_comment = BookComment.new
    @book = Book.find(params[:id])
    @book_comments = @book.book_comments.all.page(params[:page]).per(4)
    number= @book.user_id
    @user = User.find(number)
    @userx = User
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end


