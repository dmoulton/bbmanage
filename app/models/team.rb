class Team < ActiveRecord::Base
  attr_accessible :coach_id, :division_id, :losses, :name, :notes, :wins

  belongs_to :division
  has_many :people
  has_many :home_team, :class_name=>"Game", :foreign_key=>:home_team_id
  has_many :away_team, :class_name=>"Game", :foreign_key=>:away_team_id
end
