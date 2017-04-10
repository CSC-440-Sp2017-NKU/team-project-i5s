class Section < ApplicationRecord
  belongs_to :semester
  belongs_to :course
  belongs_to :user
  has_many :student_sections
  has_many :users, :through => :student_sections
end
