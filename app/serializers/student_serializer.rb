class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :dob, :contacts, :room_id
end
