class AdminUser < ApplicationRecord
  
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:phone]

  validates :phone, presence: true, uniqueness: true

  include VirtualEmail

  def self.ransackable_attributes(auth_object = nil)
    %w[id phone created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
