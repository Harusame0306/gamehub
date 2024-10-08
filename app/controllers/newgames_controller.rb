class NewgamesController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  require 'rakuten_web_service'
  
  def index
    @newgames = Newgame.all.order(created_at: :desc)
  end

  def show
    @newgame = Newgame.find(params[:id])
  end

  def new
    @newgame = Newgame.new
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
    @newgame.gameurl = params[:gameurl] # ここで@newgameに設定
  end
  
  def create
    @newgame = Newgame.new(newgame_params)
    @newgame.user_id = current_user.id
    if @newgame.save
      redirect_to newgame_path(@newgame), notice: "投稿しました"
    else
      render :new
    end
  end  

  def edit
    @user = current_user
    @newgame = Newgame.find(params[:id])
    if @newgame.user != current_user
      redirect_to games_path, alert: "アクセスできません"
    end
  end

  def update
    @newgame = Newgame.find(params[:id])
    if @newgame.update(newgame_params)
    redirect_to newgame_path(@newgame), notice: "更新しました"
    else render :edit
    end
  end

  def destroy
    @newgame = Newgame.find(params[:id])
    @newgame.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def newgame_params
    params.require(:newgame).permit(:gametitle, :gamebody, :game_image, :gameurl, :gamehard, :gametime, :gameclear)
  end
end
