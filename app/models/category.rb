class Category < ApplicationRecord
  has_many :doctors, dependent: :nullify

  def self.ransackable_attributes(auth_object = nil)
    %w[id name created_at updated_at]
  end
end
