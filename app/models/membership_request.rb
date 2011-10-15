class MembershipRequest < ActiveRecord::Base
  belongs_to :member, class_name: 'User'
  belongs_to :group

  validates_presence_of :member, :group
end
