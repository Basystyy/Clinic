class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates :date, presence: true

  # 🔍 Ransack
  def self.ransackable_attributes(auth_object = nil)
    %w[id user_id doctor_id date closed recommendation created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user doctor]
  end
end
