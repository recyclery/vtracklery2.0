class Worker < ApplicationRecord
  has_many :work_times
  has_many :events, through: :work_times
  # has_many :availability_schedules
  has_many :worker_skills
  has_many :skills, through: :worker_skills
  belongs_to :user_role
end
