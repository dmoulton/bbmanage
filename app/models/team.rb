class Team < ActiveRecord::Base
  attr_accessible :coach_id, :division_id, :losses, :name, :notes, :wins

  belongs_to :division
  has_many :people

end
