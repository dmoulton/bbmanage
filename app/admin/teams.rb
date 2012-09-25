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
  scope "10-11 year olds" do |teams|
    l = League.find_by_name("Orem 10-11 year olds")
    teams.where(:division_id=>l.division_ids)
  end
  scope "12-13 year olds" do |teams|
    l = League.find_by_name("Orem 12-13 year olds")
    teams.where(:division_id=>l.division_ids)
  end
  scope "14-15 year olds" do |teams|
    l = League.find_by_name("Orem 14-15 year olds")
    teams.where(:division_id=>l.division_ids)
  end
end
