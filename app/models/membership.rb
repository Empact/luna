class Membership < ActiveRecord::Base
  belongs_to :body
  belongs_to :member, class_name: 'User'
  belongs_to :created_by, class_name: 'User'

  validates_presence_of :body, :member, :created_by
end
