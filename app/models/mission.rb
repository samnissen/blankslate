class Mission < ActiveRecord::Base
  belongs_to :user
  belongs_to :interface
  belongs_to :formula
end
