ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: "Home"

  content do
    if current_admin_user
      h2 "Welcome, #{current_admin_user.phone}"
      h3 "Admin Dashboard"
      div do
        button_to "Logout", destroy_admin_user_session_path, method: :delete
      end
    else
      render partial: "login_prompt"
    end
  end
end