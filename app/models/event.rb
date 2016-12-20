class Event < ApplicationRecord
  has_many :work_times
  has_many :work_types, through: :work_times
  has_many :workers, through: :work_times

  def self.upcomming_events
    Event.where("date >= ?", Time.zone.now.beginning_of_day).order(date: :asc, name: :asc)
  end

end
