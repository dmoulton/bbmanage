class Division < ActiveRecord::Base
  attr_accessible :league_id, :name

  belongs_to :league
  has_many :teams

  rails_admin do
    field :name
    field :league
    field :teams
  end
end
