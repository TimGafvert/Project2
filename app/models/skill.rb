class Skill < ActiveRecord::Base
  has_many :interests
  has_many :proficiencies
  has_many :users, through: :interests
  has_many :users, through: :proficiencies
end
