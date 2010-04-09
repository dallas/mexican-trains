class PlayerSessionsController < ApplicationController
  load_and_authorize_resource

  def new
    @player_session = PlayerSession.new
  end

  def create
    @player_session = PlayerSession.new(params[:player_session])
    if @player_session.save
      redirect_back_or_default
    else
      render :action => :new
    end
  end

  def destroy
    current_player_session.destroy
    redirect_to new_player_session_url
  end
end
