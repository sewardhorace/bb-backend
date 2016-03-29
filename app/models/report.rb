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
        if params["students"]
          studentIds = params["students"].collect { |s| s["id"] }
        else studentIds = nil
        end
        StudentReport.createFromStudentIds(studentIds, report.id)
        return report
      else
        raise ActiveRecord::Rollback
        return false
      end
    end
  end

  def updateReportFromParams(params)
    puts "***" * 100
    puts params
    puts "***" * 100
    Report.transaction do
      students = params.delete("students")
      if self.update(params)
        if self.updateStudents(students)
          return self
        else
          raise ActiveRecord::Rollback
        end
      else
        return false
      end
    end
  end

  def updateStudents(students)
    current = self.students.collect { |s| s.id }
    updated = students.collect { |s| s["id"] }
    toDelete = current - updated
    toAdd = updated - current
    if !StudentReport.destroyFromStudentIds(toDelete, self.id) || !StudentReport.createFromStudentIds(toAdd, self.id) then return false end
    return true
  end
end
