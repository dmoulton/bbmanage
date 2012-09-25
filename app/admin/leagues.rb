ActiveAdmin.register League do
  menu :priority => 2
  config.filters = false

  index do
    column :name

    default_actions
  end
end
