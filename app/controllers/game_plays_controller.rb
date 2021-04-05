class GamePlaysController < ApplicationController

  def index
    render json: GamePlay.page(params[:page]), adapter: :json, meta: { total: GamePlay.count }
  end

  def create
    gamePlay = GamePlay.new(game_play_params)

    if gamePlay.save
      render json: gamePlay
    else
      render json: gamePlay.errors, status: :bad_request
    end
  end

  private

  def game_play_params
    params.require(:game_play).permit(:guest_player, :guest_move)
  end
end