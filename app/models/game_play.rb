class GamePlay < ApplicationRecord
    MOVES = ['rock', 'paper', 'scissor'].freeze
    validates :guest_move, inclusion: { in: MOVES }
    #todo validate presnece of name
end
