class GamePlaysController < ApplicationController

  #get histroy
  def index
    gamePlays = GamePlay.all
    render json: gamePlays.map{|gameplay| serialize_plays(gameplay)}
  end

  def serialize_plays(gameplay)
    ({
      "moves": [
        {
          "name": gameplay.guest_player,
          "move": gameplay.guest_move
        },
        {
          "name": gameplay.computer,
          "move": gameplay.computer_move
        }
      ],
      "result": gameplay.winner
    })
  end

  #post request
  def create
    computer_move = computer_move()
    gamePlay = GamePlay.new(
      guest_player: params[:name],
      guest_move: params[:move], 
      computer: 'bot',
      computer_move: computer_move,
      winner: winner(params[:move], computer_move)
    )

    if gamePlay.save
      render json: gamePlay
    else
      render json: gamePlay.errors, status: :bad_request
    end
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