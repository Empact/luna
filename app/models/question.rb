class Question < ActiveRecord::Base
  belongs_to :group
  belongs_to :created_by, class_name: 'User'

  has_many :answers
end
