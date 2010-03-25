class CreateRounds < ActiveRecord::Migration
  def self.up
    create_table :rounds do |t|
      t.integer :game_play_id

      t.timestamps
    end
  end

  def self.down
    drop_table :rounds
  end
end
