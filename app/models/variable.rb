class Variable < ActiveRecord::Base
  belongs_to :task
  belongs_to :task_type
end
