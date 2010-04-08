# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :login, :password

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

  private
    def current_player_session
      return @current_player_session if defined?(@current_player_session)
      @current_player_session = PlayerSession.find
    end
end
