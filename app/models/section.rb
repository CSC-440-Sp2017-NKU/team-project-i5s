class Section < ApplicationRecord
  belongs_to :semester
  belongs_to :course
  belongs_to :user
end
