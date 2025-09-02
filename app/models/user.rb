class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :confirmable, authentication_keys: [:phone]

  validates :phone, presence: true, uniqueness: true, format: { with: /\A\+380\d{9}\z/, message: "should be +380 followed by 9 digits" }
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password, length: { minimum: 6 }, allow_blank: true, on: :update

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def admin?
    role == 'admin'
  end

  def doctor?
    role == 'doctor'
  end
end
