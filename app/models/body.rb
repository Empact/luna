class Body < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  belongs_to :created_by, class_name: 'User'

  has_many :memberships do
    def for(user)
      where(member_id: user).first
    end
  end
  has_many :members, through: :memberships

  has_many :membership_requests do
    def for(user)
      where(member_id: user).first
    end
  end
  has_many :users_requesting_membership, through: :membership_requests, source: :member

  has_many :questions

  validates_presence_of :created_by

  scope :random, order('random()')

  def managers
    [created_by]
  end
end
