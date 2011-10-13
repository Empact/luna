class Body < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  belongs_to :created_by, class_name: 'User'

  has_many :memberships
  has_many :members, through: :memberships

  validates_presence_of :created_by

  scope :random, order('random()')

  def managers
    [created_by]
  end
end
