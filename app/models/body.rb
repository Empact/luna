class Body < ActiveRecord::Base
  belongs_to :created_by, class_name: 'User'

  validates_presence_of :created_by
end