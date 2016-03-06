class RemoveStudentReportIds < ActiveRecord::Migration
  def change
    remove_reference :reports, :student_report, index: true, foreign_key: true
    remove_reference :students, :student_report, index: true, foreign_key: true
  end
end
