class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @games = Game.all.order(created_at: :desc)
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    Rails.logger.debug "Received params: #{params.inspect}" # 追加

    @game = Game.new(game_params)
    @game.user_id = current_user.id

    # デバッグ用のログを追加
  Rails.logger.debug "Received game_image_id: #{params[:game][:game_image_id]}"

    if @game.save
      redirect_to game_path(@game), notice: "投稿しました"
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
    if @game.user != current_user
      redirect_to games_path, alert: "アクセスできません"
    end
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
    redirect_to game_path(@game), notice: "更新しました"
    else render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def game_params
    params.require(:game).permit(:gametitle, :gamebody, :game_image_id, :game_image, :gamehard, :gametime, :gameclear)
  end
end
