class Person < ActiveRecord::Base
  attr_accessible :active, :birthdate, :name, :notes, :number, :position_id, :team_id, :position

  belongs_to :team
  belongs_to :position

  has_one :team
end