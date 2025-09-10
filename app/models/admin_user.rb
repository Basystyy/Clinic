class AdminUser < ApplicationRecord
  
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
         authentication_keys: [:phone]

  validates :phone, presence: true, uniqueness: true

  include VirtualEmail
end
