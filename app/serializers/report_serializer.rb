class ReportSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :tags, :time, :updated_at
  has_one :room
  has_one :user
  has_many :students
end
