class GamePlaySerializer < ActiveModel::Serializer
  attributes :moves, :result, :timestamps

  def moves
      [
          {
            'name': object.guest_player,
            'move': object.guest_move
          },
          {
            'name': 'bot',
            'move': object.computer_move
          }
        ]
  end

  def timestamps
    object.created_at.to_formatted_s(:short)  
  end
end