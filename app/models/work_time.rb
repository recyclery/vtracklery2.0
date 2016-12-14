class WorkTime < ApplicationRecord
  belongs_to :worker
  belongs_to :event
  belongs_to :work_type

  validate :does_not_overlap

# before save maybe? enforce uniqueness-- throw error if there is another shift that overlaps

  def does_not_overlap
    if self.work_end

      # if another work time starts earlier than self.work_start and ends after self.work_start
      if self.worker.work_times.where("id != #{self.id}" && "work_start <= #{self.work_start}" && "work_end > #{self.work_start}").length > 0
        self.errors.add(:work_start, "Work start time cannot overlap with another shift.")
        puts self.errors.full_messages
        return false

      # else if another work time starts earlier than self.work_end and ends after self.work_end
      elsif self.worker.work_times.where("id != #{self.id}" && "work_start <= #{self.work_end}" && "work_end > #{self.work_end}")
        self.errors.add(:work_end, "Work end time cannot overlap with another shift.")
        return false
      end

    end
    return true
  end

end
