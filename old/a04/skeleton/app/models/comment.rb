class Comment < ActiveRecord::Base

  belongs_to :user,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  belongs_to :link,
  primary_key: :id,
  foreign_key: :link_id,
  class_name: :Link

  validates :body, :user_id, :link_id, presence: true

  
end
