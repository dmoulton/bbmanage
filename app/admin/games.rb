ActiveAdmin.register Game do
  menu :priority => 5

  filter :home_team
  filter :away_team
  filter :home_team_score
  filter :away_team_score
  filter :innings

  index do
    column "Winner" do |g|
      "#{g.winner.name} (#{home_or_away(g,g.winner)})"
    end
    column "Score" do |g|
      g.winning_score
    end
    column "Loser" do |g|
      "#{g.loser.name} (#{home_or_away(g,g.loser)})"
    end
    column "Score" do |g|
      g.losing_score
    end

    #column :id
    #column :home_team
    #column "Score" do |g|
    #  g.home_team_score
    #end
    #column :away_team
    #column "Score" do |g|
    #  g.away_team_score
    #end


    column :innings


    default_actions
  end
end

def home_or_away(game,team)
  game.home_team.id == team.id ? "h" : "a"
end
