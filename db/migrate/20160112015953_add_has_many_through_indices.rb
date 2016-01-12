class AddHasManyThroughIndices < ActiveRecord::Migration
  def change
    add_reference :reports, :student_report, index: true, foreign_key: true
    add_reference :students, :student_report, index: true, foreign_key: true
  end
end
