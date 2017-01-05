# == Schema Information
#
# Table name: men
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  house_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Man < ActiveRecord::Base

end
