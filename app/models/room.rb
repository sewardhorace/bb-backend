class Room < ActiveRecord::Base
  has_many :reports, dependent: :destroy
  has_many :students, dependent: :destroy
end
