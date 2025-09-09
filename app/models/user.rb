class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
          :rememberable, :validatable, :confirmable

  has_many :appointment_doctors, dependent: :destroy
  has_many :doctors, through: :appointment_doctors

  validates :phone, presence: true, uniqueness: true,
            format: { with: /\A\+380\d{9}\z/,
                    message: "should be +380 followed by 9 digits" }

  include VirtualEmail
end