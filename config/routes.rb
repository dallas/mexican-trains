ActionController::Routing::Routes.draw do |map|
  map.resources :games

  map.resources :players do |player|
    player.resources :games
  end
end
