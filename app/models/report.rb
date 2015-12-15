class Report < ActiveRecord::Base
  belongs_to :room
  has_many :students, through: :student_reports
end
