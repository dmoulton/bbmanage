require 'spec_helper'

describe Game do
  before :each do
    @t1 = Team.create({name: "Cardinals"})
    @t2 = Team.create({name: "Mets"})

    @g = Game.create({team1_id: @t1.id,team2_id: @t2.id, team1_score: 5, team2_score: 1})

    @t1.reload
    @t2.reload
  end

  it "should properly update team stats when a game is entered" do
    @g.winner.should  == @t1
    @g.loser.should   == @t2
    @t1.wins.should   == 1
    @t1.losses.should == 0
    @t2.losses.should == 1
    @t2.wins.should   == 0
  end

  it "should properly update a teams stats when a game is updated" do
    @g.update_attributes({team1_score: 1, team2_score: 5})

    @t1.reload
    @t2.reload

    @g.winner.should == @t2
    @g.loser.should  == @t1
    @t1.wins.should == 0
    @t1.losses.should == 1
    @t2.wins.should == 1
    @t2.losses.should == 0
  end
end
