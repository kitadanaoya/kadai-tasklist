class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = 
  end

  def new
  end

  def create
  end
end
