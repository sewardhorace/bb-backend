class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :dob, :contacts
end
