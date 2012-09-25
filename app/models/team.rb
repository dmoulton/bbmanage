class Team < ActiveRecord::Base
  attr_accessible :coach_id, :division_id, :losses, :name, :notes, :wins

  belongs_to :division
  has_many :people
  has_many :team1_games, :class_name=>"Game", :foreign_key=>:team1_id
  has_many :team2_games, :class_name=>"Game", :foreign_key=>:team2_id

  def games
    team1_games | team2_games
  end
end
