# == Schema Information
#
# Table name: skills
#
#  id                :integer          not null, primary key
#  privacy           :integer
#  skill_description :string
#  skill_name        :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#
class Skill < ApplicationRecord

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })

  has_many(:lessons, { :class_name => "Lesson", :foreign_key => "skill_id", :dependent => :destroy })

  has_many(:likes, { :class_name => "Like", :foreign_key => "skill", :dependent => :destroy })


  has_many(:fans, { :through => :likes, :source => :user })
  
end
