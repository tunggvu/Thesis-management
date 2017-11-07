class Thesis < ApplicationRecord
  belongs_to :user
  has_many :tasks

  enum status: [:pending, :approved, :rejected]
end
