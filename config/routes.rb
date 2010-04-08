ActionController::Routing::Routes.draw do |map|
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

  map.resource :game_play

  map.root :controller => :game_plays, :action => :new
end
