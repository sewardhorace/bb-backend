class StudentReport < ActiveRecord::Base
  belongs_to :student
  belongs_to :report

  def self.createFromStudentIds(ids, report_id)
    ids.each do |id|
      if Student.exists?(id)
        self.create(report_id: report_id, student_id: id)
      else
        return false
      end
    end
    return true
  end

  def self.destroyFromStudentIds(ids, report_id)
    ids.each do |id|
      StudentReport.find_by(student_id: id, report_id: report_id).destroy
    end
  end

end
