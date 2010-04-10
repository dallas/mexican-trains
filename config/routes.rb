ActionController::Routing::Routes.draw do |map|
  map.resources :players

  map.resource :game_play, :as => 'game-in-progress'

  map.root :controller => :game_plays, :action => :new

  map.with_options :controller => :player_sessions do |session|
    session.login 'login.:format',
      :action     => :new,
      :conditions => {:method => :get}
    session.connect 'login.:format',
      :action     => :create,
      :conditions => {:method => :post}
    session.logout 'logout.:format',
      :action     => :destroy,
      :conditions => {:method => :delete}
  end
end
