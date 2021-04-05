class CreateGamePlays < ActiveRecord::Migration[6.0]
  def change
    create_table :game_plays do |t|
      t.string :guest_player
      t.string :guest_move
      t.string :computer
      t.string :computer_move
      t.string :winner

      t.timestamps
    end
  end
end
