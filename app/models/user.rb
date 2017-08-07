class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_many :interests
 has_many :proficiencies
 has_many :skills, through: :interests
 has_many :skills, through: :proficiencies

end
