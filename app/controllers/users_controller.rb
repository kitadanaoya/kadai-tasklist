class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]

  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url if @user != current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "ユーザ登録に成功しました!"
      redirect_to @user
    else
      flash.now[:danger] = "ユーザ登録に失敗しました。もう一度お試しください"
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
