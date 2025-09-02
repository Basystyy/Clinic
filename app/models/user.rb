class User < ApplicationRecord
  # Включаем модули Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Указываем phone как ключ аутентификации
  self.authentication_keys = [:phone]

  # Виртуальный атрибут email для совместимости с Devise
  attr_accessor :email

  # Валидация phone
  validates :phone, presence: true, uniqueness: true, format: { with: /\A\+380\d{9}\z/, message: "should be +380 followed by 9 digits" }

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
