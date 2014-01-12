class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    @user.email = params[:user][:email].downcase
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Вы зарегистрированы!'
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end
end
