# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


# UserRole.destroy_all
# Worker.destroy_all
# WorkTime.destroy_all
# # AvailabilitySchedule.destroy_all
# Skill.destroy_all
# WorkerSkill.destroy_all
# Event.destroy_all
# WorkType.destroy_all
# EventWorkType.destroy_all



# user roles

roles = ["Admin", "Volunteer", "Staff", "Youth Volunteer"]

roles.each do |role|
  UserRole.create!(role: role)
end

# workers

20.times do

  this_fn = Faker::Name.first_name
  this_ln = Faker::Name.last_name

  Worker.create!(
    username: "#{this_fn}.#{this_ln}",
    first_name: this_fn,
    last_name: this_ln,
    email: Faker::Internet.free_email(this_fn),
    phone: Faker::PhoneNumber.phone_number,
    user_role_id: 2
    )

end




# events


today = Date.today

Event.create!(
  name: "Open shop",
  date: today,
  start_time: Time.new(today.year, today.month, today.day, 9, 0, 0, "+06:00"),
  end_time: Time.new(today.year, today.month, today.day, 17, 0, 0, "+06:00")
  )


tomorrow = Date.tomorrow

Event.create!(
  name: "Circus",
  date: tomorrow,
  start_time: Time.new(tomorrow.year, tomorrow.month, tomorrow.day, 9, 0, 0, "+06:00"),
  end_time: Time.new(tomorrow.year, tomorrow.month, tomorrow.day, 17, 0, 0, "+06:00")
  )

dat = Date.tomorrow + 1

Event.create!(
  name: "Volunteer orientation",
  date: dat,
  start_time: Time.new(dat.year, dat.month, dat.day, 9, 0, 0, "+06:00"),
  end_time: Time.new(dat.year, dat.month, dat.day, 17, 0, 0, "+06:00")
  )

# work types

worktypenames = ["Volunteer", "Paid", "Youth Bike Program"]

worktypenames.each do |worktypename|
  WorkType.create(
      name: worktypename
    )
end

# work times


100.times do
  WorkTime.create!(
    worker_id: Worker.all.sample.id,
    event_id: Event.all.sample.id,
    work_type_id: WorkType.all.sample.id,
    work_start: Time.new(today.year, today.month, today.day, 9, 0, 0, "+06:00"),
    work_end: Time.new(today.year, today.month, today.day, 9, 0, 0, "+06:00")
    )
end


# availability

# skills

# worker skills



# event work types
