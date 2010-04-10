# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :email, :login, :password

  helper_method :current_player

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to login_path
  end

  def current_ability
    Ability.new current_player
  end

  def current_player
    return @current_player if defined?(@current_player)
    @current_player = current_player_session && current_player_session.player
  end

  def current_game_play
    return @current_game_play if defined?(@current_game_play)
    @current_game_play = GamePlay.find_by_id(session[:game_play_id])
  end

  private
    def current_player_session
      return @current_player_session if defined?(@current_player_session)
      @current_player_session = PlayerSession.find
    end

    # Stores (in session) a location to return to after an upcoming redirection. If no location
    # is given, the URL location of the current GET request is used. If the current request is not
    # a GET, the referring request (assumed a GET) is used.
    def store_location(location = nil)
      session[:return_to] = location || (request.get? ? request.request_uri : request.env['HTTP_REFERER'])
    end

    # Works in conjunction with the +store_location+ method. If a stored location exists, this
    # will redirect to that location. Otherwise, the redirection will target the given location
    # argument. That location is optional and defaults to the root path (home page).
    def redirect_back_or_default(default = root_path)
      redirect_to(clear_location || default)
    end

    # Clears any session location kept by the +store_location+ method and returns the value that
    # was cleared or +nil+ if nothing was stored.
    def clear_location
      return_to = session[:return_to].try(:dup)
      session[:return_to] = nil
      return_to
    end
end
