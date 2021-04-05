class GamePlaySerializer < ActiveModel::Serializer
    attributes :moves, :result

    def moves
        [
            {
              "name": object.guest_player,
              "move": object.guest_move
            },
            {
              "name": object.computer,
              "move": object.computer_move
            }
          ]
    end
end