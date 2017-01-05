class Link < ActiveRecord::Base

  belongs_to :user,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  has_many :comments,
  primary_key: :id,
  foreign_key: :link_id,
  class_name: :Comment

  validates :title, :url, :user_id, presence: true
  
end
