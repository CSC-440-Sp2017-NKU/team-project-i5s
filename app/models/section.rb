class Section < ApplicationRecord
  belongs_to :semester
  belongs_to :course
  belongs_to :user
  has_many :student_sections
  has_many :users, :through => :student_sections
  
  #TODO: return students enrolled in this section
  def students
  end
  
  #TODO: return instructor for this section
  def instructor
  end
  
  #TODO: return semseter for this section
  def semester
  end
  
end
