# == Schema Information
#
# Table name: houses
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  person_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class House < ActiveRecord::Base

end
