Rails.application.config.after_initialize do
  if defined?(ActiveRecord::SessionStore::Session)
    ActiveRecord::SessionStore::Session.delete_all
  end
end