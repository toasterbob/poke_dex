class Person < ActiveRecord::Base
  belongs_to :houses,
     primary_key: :id,
     foreign_key: :house_id,
     class_name: "House"

end
