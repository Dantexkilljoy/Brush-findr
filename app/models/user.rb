# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  brushes_count   :integer
#  email           :string
#  favorites_count :integer
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  validates(:username, { :presence => true })
  validates(:username, { :uniqueness => true })

  has_many(:brushes, { :class_name => "Brush", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:favorites, { :class_name => "Favorite", :foreign_key => "user_id", :dependent => :destroy })
end
