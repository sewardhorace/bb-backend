class Report < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  has_many :student_reports, dependent: :destroy
  has_many :students, through: :student_reports
  validates :title, presence: true
  validates :user_id, presence: true
  validates :time, presence: true

  def self.search(queryString)
    where("title ilike ? OR description ilike ?", "%#{queryString}%", "%#{queryString}%")
  end

  def self.newReportFromParams(params, user)
    Report.transaction do
      report = Report.new()
      report.title = params["title"]
      report.description = params["description"]
      if room_id = params["room_id"]
        report.room_id = room_id
      end
      if time = params["time"]
        report.time = DateTime.parse(time)
      end
      report.user_id = user.id

      if report.save
        StudentReport.createFromStudentIds(params["students"], report.id)
        return report
      else
        raise ActiveRecord::Rollback
        return false
      end
    end
  end
end
