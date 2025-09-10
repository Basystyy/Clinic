class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  validates :date, presence: true
  validate :check_doctor_open_appointments

  def check_doctor_open_appointments
    if doctor && doctor.appointments.where(closed: false).count >= 10
      errors.add(:base, "Doctor has no free slots (max 10 open appointments)")
    end
  end

  after_update :close_if_recommended, if: :recommendation_changed?

  def close_if_recommended
    self.closed = true if recommendation.present?
    save
  end
end
