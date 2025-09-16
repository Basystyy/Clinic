class Doctor < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include VirtualEmail  # подмена email через phone

  belongs_to :category
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments, source: :user

  # 🔍 Ransack
  def self.ransackable_attributes(auth_object = nil)
    %w[id phone created_at updated_at category_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[appointments users category]
  end
end
