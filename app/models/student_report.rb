class StudentReport < ActiveRecord::Base
  belongs_to :student
  belongs_to :report

  def self.createFromStudentIds(students, report_id)
    if students
      students.each do |s|
        id = s["id"]
        if Student.exists?(id)
          self.create(report_id: report_id, student_id: id)
        end
      end
    else
      return false
    end
  end
end
