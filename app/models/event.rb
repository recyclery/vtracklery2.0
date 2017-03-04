class Event < ApplicationRecord
  has_many :work_times
  has_many :work_types, through: :work_times
  has_many :workers, through: :work_times

  def self.upcoming_events
    Event.where("date >= ?", Time.zone.now.beginning_of_day).order(date: :asc, name: :asc)
  end

  def self.current_events
    Event.where("start_time <= ?", Time.zone.now.beginning_of_day).where("end_time >= ?", Time.zone.now.beginning_of_day).order(date: :asc, name: :asc)
  end

end
