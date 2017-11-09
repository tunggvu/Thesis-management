class Task < ApplicationRecord
  belongs_to :thesis
  has_many :comments

  enum status: [:Progressing, :Done]
end
