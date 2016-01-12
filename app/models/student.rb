class Student < ActiveRecord::Base
  belongs_to :room
  has_many :student_reports
  has_many :reports, through: :student_reports
end
