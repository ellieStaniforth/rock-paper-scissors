class GamePlay < ApplicationRecord
    paginates_per 5
    MOVES = ['rock', 'paper', 'scissor'].freeze
    validates :guest_move, inclusion: { in: MOVES }
    #todo validate presnece of name

    before_create do
        self.computer_move = MOVES.sample
    end

    def result 
        'eli wins'
    end
end
