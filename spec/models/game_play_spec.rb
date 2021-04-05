require 'rails_helper'

RSpec.describe GamePlay, type: :model do
  describe 'validations' do 
    it { should validate_inclusion_of(:guest_move).in_array %w[rock paper scissor] }
    it { should validate_presence_of(:guest_player)}
  end

  describe '#result' do 
    [
      [ 'scissor', 'paper', 'bot wins'],
      [ 'rock', 'scissor', 'bot wins'],
      [ 'paper', 'rock', 'bot wins'],
      [ 'paper', 'paper', 'draw'],
      [ 'rock', 'rock', 'draw'],
      [ 'scissor', 'scissor', 'draw'],
      [ 'paper', 'scissor', 'Player wins'],
      [ 'scissor', 'rock', 'Player wins'],
      [ 'rock', 'paper', 'Player wins']
    ].each do |(computer_move, guest_move, result)|
      it 'returns the winner' do 
        expect(described_class.new(
          guest_player: 'Player',
          guest_move: guest_move, 
          computer_move: computer_move
        ).result).to eq result
      end
    end
  end
end
