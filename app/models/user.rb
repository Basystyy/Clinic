class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  self.authentication_keys = [:phone]

  attr_accessor :email

  has_many :appointment_doctors, dependent: :destroy
  has_many :doctors, through: :appointment_doctors

  validates :phone, presence: true, uniqueness: true, format: { with: /\A\+380\d{9}\z/, message: "should be +380 followed by 9 digits" }

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  def admin?
    role == 'admin'
  end

  def doctor?
    role == 'doctor'
  end
end