class Task < ApplicationRecord
  belongs_to :thesis

  enum status: [:new, :progressing, :done ]
end
