ActiveAdmin.register Division do
  menu :priority => 3

  filter :league

  index do
    column :name
    column :league

    default_actions
  end
end
