# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  fan        :integer
#  skill      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Like < ApplicationRecord

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "fan" })

  belongs_to(:interest, { :required => true, :class_name => "Skill", :foreign_key => "skill" })

end
