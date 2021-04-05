require 'rails_helper'

RSpec.describe GamePlay, type: :model do
  describe 'validations' do 
    it { should validate_inclusion_of(:guest_move).in_array %w[rock paper scissor] }
  end
end
