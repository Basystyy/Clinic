class Doctor < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable

  validates :phone, presence: true, uniqueness: true

  belongs_to :category

  has_many :appointment_doctors
  has_many :users, through: :appointment_doctors

  include VirtualEmail
end
