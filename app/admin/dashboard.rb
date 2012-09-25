ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => "Standings"

  content :title => "Standings" do
    League.order("id desc").all.each do |league|
      columns do

        league.divisions.each do |division|
          column do
            panel "#{league.name} - #{division.name}" do
              table_for division.teams.order("wins desc") do
                column :name
                column :wins
                column :losses
              end
            end
          end
        end
      end
    end
    #div :class => "blank_slate_container", :id => "dashboard_default_message" do
    #  span :class => "blank_slate" do
    #    span "Welcome to Active Admin. This is the default dashboard page."
    #    small "To add dashboard sections, checkout 'app/admin/dashboards.rb'"
    #  end
    #end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
