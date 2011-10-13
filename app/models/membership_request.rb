class MembershipRequest < ActiveRecord::Base
  belongs_to :member, class_name: 'User'
  belongs_to :body

  validates_presence_of :member, :body
end
