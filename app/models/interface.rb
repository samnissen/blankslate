class Interface < ActiveRecord::Base
  belongs_to :user
  has_many :missions
end
