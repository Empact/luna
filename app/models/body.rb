class Body < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  belongs_to :created_by, class_name: 'User'

  validates_presence_of :created_by

  def managers
    [created_by]
  end
end
