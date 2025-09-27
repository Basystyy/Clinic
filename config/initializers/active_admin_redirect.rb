ActiveSupport.on_load(:after_initialize) do
  ActiveAdmin::Devise::SessionsController.class_eval do
    private

    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :admin_user || resource_or_scope.is_a?(AdminUser)
        Rails.application.routes.url_helpers.root_path
      else
        super
      end
    end
  end
end
