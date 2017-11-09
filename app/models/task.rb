class Task < ApplicationRecord
  belongs_to :thesis
  has_many :comments

  validates :name, presence: true

  enum status: [:Progressing, :Done]
end
