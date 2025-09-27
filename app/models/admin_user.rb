class AdminUser < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  
  validates :phone, presence: true, uniqueness: true

  before_validation :set_dummy_email, if: -> { email.blank? }

  def set_dummy_email
    self.email = "#{phone}@admin.local"
  end

    # Ransack
  def self.ransackable_attributes(auth_object = nil)
    %w[id email phone created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end