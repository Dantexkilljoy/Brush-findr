# == Schema Information
#
# Table name: brushes
#
#  id           :integer          not null, primary key
#  brush_name   :string
#  website_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  artstyle_id  :integer
#  program_id   :integer
#  user_id      :integer
#
class Brush < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:artstyle, { :required => true, :class_name => "Artstyle", :foreign_key => "artstyle_id" })
  belongs_to(:program, { :required => true, :class_name => "Program", :foreign_key => "program_id" })
end
