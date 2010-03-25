class CreateScores < ActiveRecord::Migration
  def self.up
    create_table :scores do |t|
      t.integer :round_id

      t.timestamps
    end
  end

  def self.down
    drop_table :scores
  end
end
