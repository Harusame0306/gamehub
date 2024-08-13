class HomeController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc).limit(8)
    @newgames = Newgame.all.order(created_at: :desc).limit(12)
    @posts = Post.all.order(created_at: :desc).limit(10)
    @games = Game.all.order(created_at: :desc).limit(12)
  end
end
