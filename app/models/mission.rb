class Mission < ActiveRecord::Base
  belongs_to :user
  belongs_to :interface
end
