class WorkTime < ApplicationRecord
  belongs_to :worker
  belongs_to :event
  belongs_to :work_type
end
