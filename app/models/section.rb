class Section < ApplicationRecord
  belongs_to :semester
  belongs_to :course
  belongs_to :user
  has_many :student_sections
 # has_many :users, :through => :student_sections
  has_many :courses, :through => :student_sections
  has_one :users
  #sections are taught by instructors
  
  #return students enrolled in this section
  def students # Want: student id and student names on Users Table
    return User.joins(:sections).where(:sections => {:id => self.id}).all
  end
  
  #return instructor for this section
  def instructor #want to return the instructor id and name from the users table
   # return Users.Section.where(:users.id => :section.id)
    return User.find(self.user_id)
  end
  
  #TODO: return semseter for this section
  def semester
    return Section.where(semester_id: self.id)
  end
  
  def full_name
    semester = Semester.find(self.semester_id)
    return self.section_name + " " + semester.session.to_s + " " + semester.academic_year.to_s
  end
  
  def course
    return Course.find(self.course_id)
  end
  
end
