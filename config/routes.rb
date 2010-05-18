ActionController::Routing::Routes.draw do |map|
  map.resource :game, :only => [:show, :new, :create] do |game|
    game.resources :rounds, :only => [:index, :show, :update], :name_prefix => nil
  end

  map.resources :players do |player|
    player.resources :scores, :only => [:index, :show]
  end

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

  map.root :controller => :games, :action => :new
end
