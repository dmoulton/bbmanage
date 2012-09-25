ActiveAdmin.register Team do
  menu :priority => 4

  filter :division
  filter :wins
  filter :losses


  index do
    column :name
    column :wins
    column :losses

    column "Pct" do |team|
      number_with_precision( team.wins.to_f / (team.wins.to_f + team.losses.to_f) , :precision => 3)
    end


    default_actions
  end

  scope :all, :default=>true
  scope "Peewee" do |teams|
    l = League.find_by_name("Peewee")
    teams.where(:division_id=>l.division_ids)
  end
  scope "Junior" do |teams|
    l = League.find_by_name("Junior")
    teams.where(:division_id=>l.division_ids)
  end
  scope "Senior" do |teams|
    l = League.find_by_name("Senior")
    teams.where(:division_id=>l.division_ids)
  end
end
