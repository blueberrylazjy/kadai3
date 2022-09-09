class UsersController < ApplicationController
  def show
    @users = User.page(params[:page])
    @booksx = Book.all.page(params[:page]).per(10)
    @user = User.find(params[:id])
    @userx = User
    @books = @user.books.all.page(params[:page]).per(10)

  end
   # @user = User.find(params[:id])
   # @books = @user.books.page(params[:page])

  def index
    @users = User.page(params[:page])
    @user = current_user

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
   if @user.save
     flash[:notice] = "You have updated user successfully."
     redirect_to user_path(@user.id)
   else
     render :edit;
   end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
