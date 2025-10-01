class Appointment < ApplicationRecord
  belongs_to :doctor, optional: true
  belongs_to :user
  validates :date, presence: true

  before_save :close_if_commented
  before_create :store_doctor_data

  def self.ransackable_attributes(auth_object = nil)
    %w[id doctor_id user_id date closed recommendation created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[doctor user]
  end

  private

  def store_doctor_data
    if doctor.present?
      self.doctor_name = doctor.name
      self.doctor_category_name = doctor.category&.name
    end
  end

  def close_if_commented
    self.closed = recommendation.present?
  end

end