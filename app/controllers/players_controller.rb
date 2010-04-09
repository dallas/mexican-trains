class PlayersController < ApplicationController
  load_and_authorize_resource

  def new
    @player = Player.new
  end

  def create
    @player = Player.new params[:player]
    if @player.save
      flash[:notice] = "#{@player.name} is now registered!"
      redirect_back_or_default players_path
    else
      render :new
    end
  end
end
