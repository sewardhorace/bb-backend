class StudentReport < ActiveRecord::Base
  belongs_to :student
  belongs_to :report

end
