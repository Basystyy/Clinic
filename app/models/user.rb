class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
          :rememberable, :validatable,
          authentication_keys: [:phone]

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments

  validates :phone, presence: true, uniqueness: true,
            format: { with: /\A\+380\d{9}\z/,
                    message: "should be +380 followed by 9 digits" }

  include VirtualEmail

  def self.ransackable_attributes(auth_object = nil)
    %w[id phone role created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[appointments doctors]
  end
end