class Doctor < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable
         authentication_keys: [:phone]

  validates :phone, presence: true, uniqueness: true

  belongs_to :category

  has_many :appointments
  has_many :users, through: :appointments, source: :user

  include VirtualEmail
end
