# == Schema Information
#
# Table name: artstyles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artstyle < ApplicationRecord
  # has_many(:brushes, { :class_name => "Brush", :foreign_key => "artstyle_id", :dependent => :nullify })
end
