ActionController::Routing::Routes.draw do |map|
  map.resources :players

  map.resource :game_play

  map.root :controller => :game_plays, :action => :new

  map.with_options :controller => :player_sessions do |session|
    session.login 'login.:format',
      :action     => :new,
      :conditions => {:method => :get}
    session.connect 'login.:format',
      :action     => :create,
      :conditions => {:method => :post}
    session.logout 'logout.:format',
      :action     => :logout,
      :conditions => {:method => :delete}
  end
end
