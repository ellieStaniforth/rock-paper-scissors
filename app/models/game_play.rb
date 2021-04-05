class GamePlay < ApplicationRecord
  paginates_per 5
  MOVES = ['rock', 'paper', 'scissor'].freeze
  validates :guest_move, inclusion: { in: MOVES }
  #todo validate presnece of name

  before_create do
    self.computer_move = MOVES.sample
  end

  def result 
    return 'draw' if guest_move == computer_move
    return "#{guest_player} wins" if guest_move == 'rock' && computer_move == 'scissor'
    return "#{guest_player} wins" if guest_move == 'paper' && computer_move == 'rock'
    return "#{guest_player} wins" if guest_move == 'scissor' && computer_move == 'paper'
    return "bot wins" if computer_move == 'rock' && guest_move == 'scissor'
    return "bot wins" if computer_move == 'paper' && guest_move == 'rock'
    return "bot wins" if computer_move == 'scissor' && guest_move == 'paper'
  end
end
