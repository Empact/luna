class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :created_by, class_name: 'User'
end
