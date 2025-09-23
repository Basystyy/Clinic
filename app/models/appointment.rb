class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user
  validates :date, presence: true
  after_save :close_if_commented

  private

  def close_if_commented
    if comment.present? && !closed?
      update(closed: true)
    end
  end
end