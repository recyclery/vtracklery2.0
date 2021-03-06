class Worker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :work_times
  has_many :events, through: :work_times
  # has_many :availability_schedules
  has_many :worker_skills
  has_many :skills, through: :worker_skills
  belongs_to :user_role

  def unclosed_shift

    if self.work_times.last && !self.work_times.last.work_end
      return true
    else
      return false
    end
  end

end
