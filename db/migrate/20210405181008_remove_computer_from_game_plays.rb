class RemoveComputerFromGamePlays < ActiveRecord::Migration[6.0]
  def change
    remove_column :game_plays, :computer, :String
  end
end
