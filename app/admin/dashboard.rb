ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
     # span :class => "blank_slate" do
        span  do
       # span I18n.t("active_admin.dashboard_welcome.welcome")
      #  small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Outstanding order" do
          ul do
            Order.where(:is_outstanding=>true).map do |post|
              li link_to(post.id, admin_order_path(post))  
              div post.name
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
                panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    
    end

  end # content
end
