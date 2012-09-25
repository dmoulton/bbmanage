class Game < ActiveRecord::Base
  attr_accessible :away_team_score, :notes, :home_team_id, :away_team_id, :home_team_score, :innings, :home_team, :away_team

  belongs_to :home_team, :class_name => "Team"
  belongs_to :away_team, :class_name => "Team"
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
    if home_team_score > away_team_score
      id = home_team_id
    else
      id = away_team_id
    end
    Team.find(id)
  end

  def winning_score
    home_team_score > away_team_score ? home_team_score : away_team_score
  end

  def losing_score
    home_team_score < away_team_score ? home_team_score : away_team_score
  end

  def loser
    if home_team_score < away_team_score
      id = home_team_id
    else
      id = away_team_id
    end
    Team.find(id)
  end

  private

  def winner_was
    if home_team_score_was > away_team_score_was
      id = home_team_id
    else
      id = away_team_id
    end
    Team.find(id)
  end

  def loser_was
    if home_team_score_was < away_team_score_was
      id = home_team_id
    else
      id = away_team_id
    end
    Team.find(id)
  end
end
