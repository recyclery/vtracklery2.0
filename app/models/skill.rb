class Skill < ApplicationRecord
  has_many :worker_skills
  has_many :workers, through: :worker_skills
end
