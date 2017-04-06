class StudentSection < ApplicationRecord
  belongs_to :user
  belongs_to :section
  belongs_to :course
end
