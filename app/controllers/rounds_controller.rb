class RoundsController < ApplicationController
  # {"commit"=>"Next Round", "action"=>"update", "_method"=>"put", "authenticity_token"=>"7728Ja+jS3hTMStgM2h+8wR3Q+ZKZhxlB4lcH1edt/Q=", "id"=>"2", "round"=>{"scores_attributes"=>{"0"=>{"id"=>"3", "score"=>"0"}, "1"=>{"id"=>"4", "score"=>"0"}}}, "controller"=>"rounds"}
  def update
    round = Round.find params[:id]
    if round.update_attributes params[:round]
      players = current_game.players
      if round = current_game.new_round
        players.each {|p| round.scores.build(:player => p) }
        current_game.save
      else
        flash[:notice] = "Game over! #{current_game.winner.login} wins!"
      end
    else
      flash[:error] = 'Unable to update round.'
    end
    redirect_to game_path
  end
end
