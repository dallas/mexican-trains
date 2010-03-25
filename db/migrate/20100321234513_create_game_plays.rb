class CreateGamePlays < ActiveRecord::Migration
  def self.up
    create_table :game_plays do |t|
      t.integer :game_id
      t.timestamps
    end
  end

  def self.down
    drop_table :game_plays
  end
end