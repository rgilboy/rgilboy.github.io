# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  skills_count    :integer
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:skills, { :class_name => "Skill", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:likes, { :class_name => "Like", :foreign_key => "fan", :dependent => :destroy })

  has_many(:interests, { :through => :likes, :source => :interest })
end
