ActiveAdmin.register Game do
  filter :home_team
  filter :away_team
  filter :home_team_score
  filter :away_team_score
  filter :innings

  index do
    column :id
    column :winner
    column :loser
    column :innings
  end
end
