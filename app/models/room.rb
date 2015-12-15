class Room < ActiveRecord::Base
  has_many :reports
  has_many :students
end
