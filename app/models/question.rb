class Question < ActiveRecord::Base
  belongs_to :body
  belongs_to :created_by, class_name: 'User'

  has_many :answers
end
