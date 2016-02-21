class Student < ActiveRecord::Base
  belongs_to :room
  has_many :student_reports
  has_many :reports, through: :student_reports

  def self.roomFilter(room_id)
    where("room_id = ?", room_id)
  end

  def self.search(queryString)
    where("name ilike ?", "#{queryString}%")
  end
end
