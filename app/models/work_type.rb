class WorkType < ApplicationRecord
  has_many :work_times
  has_many :workers, through: :work_times
  has_many :events, through: :work_times
end
