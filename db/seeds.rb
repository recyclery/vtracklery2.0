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



ben = Worker.create!(
  username: "ben.vansickle",
  first_name: "Ben",
  last_name: "Van Sickle",
  email: "benjamin.m.vansickle@gmail.com ",
  phone: "3121234567",
  user_role_id: 1,
  password: "password"
  )

rob = Worker.create!(
  username: "rob.dale",
  first_name: "Rob",
  last_name: "Dale",
  email: "robzd1@gmail.com ",
  phone: "3121234567",
  user_role_id: 1,
  password: "password"
  )

melanie = Worker.create!(
  username: "melanie.mazanec",
  first_name: "Melanie",
  last_name: "Mazanec",
  email: "melanie.mazanec@gmail.com",
  phone: "3121234567",
  user_role_id: 1,
  password: "password"
  )


20.times do

  this_fn = Faker::Name.first_name
  this_ln = Faker::Name.last_name

  Worker.create!(
    username: "#{this_fn.downcase}.#{this_ln.downcase}",
    first_name: this_fn,
    last_name: this_ln,
    email: Faker::Internet.free_email(this_fn),
    phone: Faker::PhoneNumber.phone_number,
    user_role_id: 2,
    password: "password"
    )

end




# events


today = Date.today

Event.create!(
  name: "Open shop",
  description: "Just come in, hang out, and work a bunch!",
  date: today,
  start_time: Time.new(today.year, today.month, today.day, 9, 0, 0, "+06:00"),
  end_time: Time.new(today.year, today.month, today.day, 17, 0, 0, "+06:00")
  )


tomorrow = Date.tomorrow

Event.create!(
  name: "Circus",
  description: "We'll have a juggler, fire eater, and a dog that does tricks!",
  date: tomorrow,
  start_time: Time.new(tomorrow.year, tomorrow.month, tomorrow.day, 9, 0, 0, "+06:00"),
  end_time: Time.new(tomorrow.year, tomorrow.month, tomorrow.day, 17, 0, 0, "+06:00")
  )

dat = Date.tomorrow + 1

Event.create!(
  name: "Volunteer orientation",
  description: "Learn the ropes to become a regular volunteer",
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
    worker_id: rand(4..23),
    event_id: Event.all.sample.id,
    work_type_id: WorkType.all.sample.id,
    work_start: Time.new(today.year, today.month, today.day, 9, 0, 0, "+06:00"),
    work_end: Time.new(today.year, today.month, today.day, 9, 0, 0, "+06:00")
    )
end


Event.all.each do |ev|
  WorkTime.create(
      worker_id: ben.id,
      event_id: ev.id,
      work_type_id: WorkType.all.sample.id,
      work_start: ev.start_time,
      work_end: ev.end_time
      )
  WorkTime.create(
      worker_id: rob.id,
      event_id: ev.id,
      work_type_id: WorkType.all.sample.id,
      work_start: ev.start_time,
      work_end: ev.end_time
      )
  WorkTime.create(
      worker_id: melanie.id,
      event_id: ev.id,
      work_type_id: WorkType.all.sample.id,
      work_start: ev.start_time,
      work_end: ev.end_time
      )
end






# skills
Skill.create(name: "name bike")
Skill.create(name: "fix flat")
Skill.create(name: "replace tire")
Skill.create(name: "replace seat")
Skill.create(name: "replace cables")
Skill.create(name: "adjust brakes")
Skill.create(name: "adjust derailleurs")
Skill.create(name: "replace brakes")
Skill.create(name: "replace shifters")
Skill.create(name: "remove pedals")
Skill.create(name: "replace crank")
Skill.create(name: "adjust bearing")
Skill.create(name: "overhaul hubs")
Skill.create(name: "overhaul bracket")
Skill.create(name: "overhaul headset")
Skill.create(name: "true wheels")
Skill.create(name: "replace fork")
Skill.create(name: "drive stick")




# worker skills

Skill.all.each do |skill|
  WorkerSkill.create(proficiency: rand(0..5), worker_id: rand(0..3), skill_id: skill.id)
end





# availability

# event work types
