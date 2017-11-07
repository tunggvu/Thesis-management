class Task < ApplicationRecord
  belongs_to :thesis

  enum status: [:Progressing, :Done]
end
