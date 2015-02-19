class Task < ActiveRecord::Base
  belongs_to :task_type
  has_and_belongs_to_many :formula
  
  has_many :variables
end
