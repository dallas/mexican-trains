class GamesController < ApplicationController
  before_filter :load_game, :only => [:show, :edit, :update]
  load_and_authorize_resource

  def new
    store_location
    @players  = Player.all
    @game     = Game.new
  end

  def create
    @game = Game.new params[:game]
    if @game.save
      session[:game_id] = @game.id
      redirect_to game_url
    else
      @players = Player.all
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private
    def load_game
      redirect_to new_game_url unless @game = current_game
    end
end
