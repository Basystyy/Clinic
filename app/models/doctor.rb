class Doctor < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable,
         authentication_keys: [:phone]

  validates :phone, presence: true, uniqueness: true

  belongs_to :category
  has_many :appointments
  has_many :users, through: :appointments, source: :user

  include VirtualEmail

  def self.ransackable_attributes(auth_object = nil)
    %w[id name phone category_id created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category appointments users]
  end
end
