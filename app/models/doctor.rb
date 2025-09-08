class Doctor < ApplicationRecord
  belongs_to :category
  has_many :appointment_doctors
  has_many :users, through: :appointment_doctors
end
