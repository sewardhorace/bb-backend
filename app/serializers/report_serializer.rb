class ReportSerializer < ActiveModel::Serializer
  attributes :title, :description, :tags, :time
  has_one :room
  has_one :user, key: :author
  has_many :students
end
