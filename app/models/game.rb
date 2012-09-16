class Game < ActiveRecord::Base
  attr_accessible :losing_score, :notes, :team1_id, :team2_id, :winner_id, :winning_score
end
