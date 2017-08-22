class Skill < ActiveRecord::Base
  has_many :interests
  has_many :proficiencies

  # We shouldn't use the same relation name (:users) for multiple relations

  # has_many :users, through: :interests
  # has_many :users, through: :proficiencies

  # We can alias the relation with a different name, and then specify the source
  # model using the `:source` key
  has_many :interested_users, source: :user , through: :interests
  has_many :proficient_users, source: :user , through: :proficiencies
end
