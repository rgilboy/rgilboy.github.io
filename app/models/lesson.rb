# == Schema Information
#
# Table name: lessons
#
#  id         :integer          not null, primary key
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  skill_id   :integer
#
class Lesson < ApplicationRecord

  belongs_to(:skill, { :required => true, :class_name => "Skill", :foreign_key => "skill_id" })
  
end
