class TaskType < ActiveRecord::Base
  has_many :tasks
  has_many :variables
end
