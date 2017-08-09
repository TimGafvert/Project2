User.destroy_all
Skill.destroy_all
Proficiency.destroy_all
Interest.destroy_all
require 'ffaker'

tim = User.create(email: 'yoloswag@stuff.bumble', password: 'password')

52.times do
  Skill.create(name: FFaker::Skill.tech_skill)
end

Skill.all.each do |s|
  puts s.name
end
#
# skills = Skill.create([
#   {name:"Nunchuck"},
#   {name:"Bow Hunting"},
#   {name:"Computer Hacking"}
# ])
