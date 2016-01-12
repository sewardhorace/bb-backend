class StudentSerializer < ActiveModel::Serializer
  attributes :name, :dob, :contacts
end
