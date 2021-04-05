class GamePlaysController < ApplicationController

  #get histroy
  def index
    render json: GamePlay.page(params[:page])
  end

  #post request
  def create
    computer_move = computer_move()
    gamePlay = GamePlay.new(game_play_params)

    if gamePlay.save
      render json: gamePlay
    else
      render json: gamePlay.errors, status: :bad_request
    end
  end
  #private

  def game_play_params
    params.require(:game_play).permit(:guest_player, :guest_move)
  end

  def computer_move()
    ["rock", "paper", "scissor"].sample
  end

  def winner(player, computer)
    return 'draw' if player == computer
    return "#{params[:name]} wins" if player == 'rock' && computer == 'scissor'
    return "#{params[:name]} wins" if player == 'paper' && computer == 'rock'
    return "#{params[:name]} wins" if player == 'scissor' && computer == 'paper'
    return "bot wins" if computer == 'rock' && player == 'scissor'
    return "bot wins" if computer == 'paper' && player == 'rock'
    return "bot wins" if computer == 'scissor' && player == 'paper'
  end
end

#refactoring
#testing
#naming of variables