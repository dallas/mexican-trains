class Forgery::Game < Forgery
  def self.name
    dictionaries[:game_names].random
  end
end
