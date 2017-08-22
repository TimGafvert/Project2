class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :proficiencies
  has_many :interests

  # We shouldn't use the same relation name (:skills) for multiple relations

  # has_many :skills, through: :proficiencies
  # has_many :skills, through: :interests

  # We can alias the relation with a different name, and then specify the source
  # model using the `:source` key
  has_many :proficient_skills, source: :skill, through: :proficiencies
  has_many :interested_skills, source: :skill, through: :interests
end
