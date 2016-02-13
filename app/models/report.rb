class Report < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  has_many :student_reports
  has_many :students, through: :student_reports

  def self.newReportFromParams(params, user)
    Report.transaction do
      report = Report.new()
      report.title = params["title"]
      report.description = params["description"]
      report.user_id = user.id
      if report.save
        StudentReport.transaction do
          params["students"].each do |s|
            unless (Student.exists?(s["id"]) && StudentReport.create(report_id: report.id, student_id: s["id"]))
              ActiveRecord::Rollback
              return false
            end
          end
        end
        return report
      else
        raise ActiveRecord::Rollback
        return false
      end
    end
  end
end
