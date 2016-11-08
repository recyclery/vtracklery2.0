class Event < ApplicationRecord
  has_many :work_times
  has_many :work_types, through: :work_times
end
