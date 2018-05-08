class Thesis < ApplicationRecord
  belongs_to :user, optional: true
  has_many :tasks

  validates :name, presence: true

  enum status: [:pending, :approved, :rejected]
end
