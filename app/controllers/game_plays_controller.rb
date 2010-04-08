class GamePlaysController < ApplicationController
  load_and_authorize_resource

  def new
    @game = Game.first
    @game_play = GamePlay.new
    @players = Player.all
  end

  def create
    @game_play = GamePlay.create(params[:game_play])
    redirect_to :show
  end

  def show
    @game_paly = GamePlay.find(params[:id])
  end

  def edit
    @game_play = GamePlay.find(params[:id])
  end

  def update
    @game_play = GamePlay.find(params[:id])
  end
end
