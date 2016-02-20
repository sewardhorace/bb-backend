class ReportSerializer < ActiveModel::Serializer
  attributes :title, :description, :tags, :time, :updated_at
  has_one :room
  has_one :user, key: :author
  has_many :students
end
