class AdminUser < ApplicationRecord
  
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  validates :phone, presence: true, uniqueness: true

  include VirtualEmail
end
