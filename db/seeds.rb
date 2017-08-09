User.destroy_all
Skill.destroy_all
Proficiency.destroy_all
Interest.destroy_all


tim = User.create(email: 'yoloswag@stuff.bumble', password: 'password')




skills = Skill.create([
  {name:"Numchuck"},
  {name:"Bow Hunting"},
  {name:"Computer Hacking"}
])
