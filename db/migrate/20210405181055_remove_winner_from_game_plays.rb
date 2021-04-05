class RemoveWinnerFromGamePlays < ActiveRecord::Migration[6.0]
  def change
    remove_column :game_plays, :winner, :String
  end
end
