class CreateStudentReports < ActiveRecord::Migration
  def change
    create_table :student_reports do |t|
      t.integer :student_id, index: true
      t.integer :report_id, index: true
      
      t.timestamps null: false
    end
  end
end
