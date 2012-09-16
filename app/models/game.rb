class Game < ActiveRecord::Base
  attr_accessible :team2_score, :notes, :team1_id, :team2_id, :team1_score, :innings

  belongs_to :team1, :polymorphic => true
  belongs_to :team2, :polymorphic => true

  after_validation :update_stats

  def update_stats
    w = self.winner
    w.wins += 1
    w.save

    l = self.loser
    l.losses += 1
    l.save
  end

  def winner
    if team1_score > team2_score
      id = team1_id
    else
      id = team2_id
    end
    Team.find(id)
  end

  def loser
    if team1_score < team2_score
      id = team1_id
    else
      id = team2_id
    end
    Team.find(id)
  end
end
