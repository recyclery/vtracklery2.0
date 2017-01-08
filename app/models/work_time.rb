class WorkTime < ApplicationRecord
  belongs_to :worker
  belongs_to :event
  belongs_to :work_type

  validate :does_not_overlap

# before save maybe? enforce uniqueness-- throw error if there is another shift that overlaps

  def does_not_overlap
    if self.work_end

      # if another work time starts earlier than self.work_start and ends after self.work_start
      if self.worker.work_times.where("id != ?", self.id).where("work_start <= ?", self.work_start).where("work_end >= ?", self.work_start).length > 0
        self.errors.add(:work_start, "Shift cannot overlap with another shift.")
        return false

      # else if another work time starts earlier than self.work_end and ends after self.work_end
      elsif self.worker.work_times.where("id != ?", self.id).where("work_start <= ?", self.work_end).where("work_end > ?", self.work_end).length > 0
        self.errors.add(:work_end, "Shift cannot overlap with another shift.")
        return false

      # else if work end time is before work begin time
      elsif self.work_end < self.work_start
        self.errors.add(:work_end, "Shift cannot end before it starts.")
        return false
      end

    end
    return true
  end

end
