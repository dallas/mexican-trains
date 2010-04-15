class AddDoubleToRounds < ActiveRecord::Migration
  def self.up
    add_column :rounds, :double, :integer
  end

  def self.down
    remove_column :rounds, :double
  end
end
