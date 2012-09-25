ActiveAdmin.register Person do
  menu :priority => 6

  index do
    column :name
    column :number
    column "Team" do |person|
      person.team.name
    end

    column "position" do |person|
      person.position.name
    end

    default_actions

  end
end
