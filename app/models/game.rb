class Game < ActiveRecord::Base
  attr_accessible :team2_score, :notes, :team1_id, :team2_id, :team1_score, :innings, :team1, :team2

  belongs_to :team1_games
  belongs_to :team2_games
  after_validation :update_stats

  def update_stats
    if !new_record?
      ww = winner_was
      ww.wins -= 1
      ww.save

      lw = loser_was
      lw.losses -= 1
      lw.save
    end

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

  private

  def winner_was
    if team1_score_was > team2_score_was
      id = team1_id
    else
      id = team2_id
    end
    Team.find(id)
  end

  def loser_was
    if team1_score_was < team2_score_was
      id = team1_id
    else
      id = team2_id
    end
    Team.find(id)
  end
end
