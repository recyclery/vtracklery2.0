class WorkTime < ApplicationRecord
  belongs_to :worker
  belongs_to :event
  belongs_to :work_type

# before save maybe? enforce uniqueness-- throw error if there is another shift that overlaps

  def work_start_string
  end

  def work_end_string
  end
end
