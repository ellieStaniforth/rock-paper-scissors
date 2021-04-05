class GamePlaySerializer < ActiveModel::Serializer
    attributes :moves, :result

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
end