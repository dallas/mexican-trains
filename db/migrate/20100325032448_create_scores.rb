class CreateScores < ActiveRecord::Migration
  def self.up
    create_table :scores do |t|
      t.integer :round_id
      t.integer :player_id
      t.integer :score,     :default => 0, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :scores
  end
end
