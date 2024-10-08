class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.all.order(created_at: :desc).limit(1).first
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to games_path, alert: "アクセスできません"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user), notice: "更新しました"
    else render :edit
    end
  end

# フォロー一覧
def follows
  user = User.find(params[:id])
  @users = user.following_users
end

# フォロワー一覧
def followers
  user = User.find(params[:id])
  @users = user.follower_users
end

def show
  @user = User.find(params[:id])
  @following_users = @user.following_users
  @follower_users = @user.follower_users
end

  private

  def user_params
    params.require(:user).permit(:username, :email, :profile, :usernumber, :profile_image, :youtube, :twitter, :twitch, :sns, :discode)
  end
end
