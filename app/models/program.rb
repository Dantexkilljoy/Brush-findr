# == Schema Information
#
# Table name: programs
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Program < ApplicationRecord
  has_many(:brushes, { :class_name => "Brush", :foreign_key => "program_id", :dependent => :nullify })
end
