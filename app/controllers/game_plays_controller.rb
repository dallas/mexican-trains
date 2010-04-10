class GamePlaysController < ApplicationController
  before_filter :load_game_play, :only => [:show, :edit, :update]
  load_and_authorize_resource

  def new
    store_location
    @players    = Player.all
    @game_play  = GamePlay.new
  end

  def create
    @game_play = GamePlay.new(params.fetch('game_play', {}).merge(:game => Game.first))
    if @game_play.save
      session[:game_play_id] = @game_play.id
      redirect_to game_play_url
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
    def load_game_play
      @game_play = current_game_play
      redirect_to new_game_play_url if @game_play.nil?
    end
end
