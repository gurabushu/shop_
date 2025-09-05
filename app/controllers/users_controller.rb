class UsersController < ApplicationController
  
  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
        redirect_to @user, notice: "ユーザー情報を作成しました。"
    else
        render :new
    end
  end
  

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "ユーザー情報を削除しました。"
  end


end
