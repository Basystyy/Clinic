class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments

  include VirtualEmail

  def self.ransackable_attributes(auth_object = nil)
    %w[id phone created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[appointments doctors]
  end
end
