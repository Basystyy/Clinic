class Doctor < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include VirtualEmail

  belongs_to :category
  has_many :appointments, dependent: :nullify
  has_many :users, through: :appointments

  before_destroy :archive_appointments, prepend: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id phone created_at updated_at category_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[appointments users category]
  end

  private
  
  def archive_appointments
    appointments.where(closed: true).find_each do |appt|
      appt.update!(archived: true)
    end
    appointments.where(closed: false).destroy_all
  end
end
