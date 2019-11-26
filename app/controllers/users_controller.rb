class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, 
  :show, :followings, :followers, :likes]
  
  def index
    @users = User.all.page(params[:page])
  end
  
  def new
    
    @user = User.new
  end
 
  def create
 
   @user = User.new(user_params)
  
   if @user.save!
     log_in @user
     redirect_to root_path, success: '登録が完了しました'
     redirect_to 
   else
     flash.now[:danger] = "登録に失敗しました"
     render :new
   end
  end
  
 private
 def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation)
 end
end
