module VirtualEmail
  extend ActiveSupport::Concern

  included do
    attr_accessor :email
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  def email
    "#{phone}@example.com"
  end
end