class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user
  validates :date, presence: true
  before_save :close_if_commented

  def self.ransackable_attributes(auth_object = nil)
    %w[id doctor_id user_id date closed recommendation created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[doctor user]
  end

  private

  def close_if_commented
    if recommendation.present?
      self.closed = true if recommendation.present?
    end
  end
end