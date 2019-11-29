class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users)
  end
  
  def new
    @topic = Topic.new
  end
  
  def new
    if logged_in?
      @topic = Topic.new
    else
      redirect_to login_path,info: 'ログインして下さい'
    end
  end

  def create
    
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def edit
    @topic = Topic.find_by(id: params[:id])
  end
  
  def update
    @topic = Topic.find_by(id: params[:id])
    
   if @topic.update(topic_params)
     redirect_to topics_path
   else
     flash.now[:danger] = 'コメントを記入してください'
     render :edit
   end
    
  end

  private
   def topic_params
    params.require(:topic).permit(:image, :description)
   end
  
   def login_check
    unless user_logged_in?
     flash[:alert]="ログインしてください"
     redirect_to root_path
    end
   end
end