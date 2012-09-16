class Division < ActiveRecord::Base
  attr_accessible :league_id, :name

  belongs_to :league
  has_many :teams
end
