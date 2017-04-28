class Section < ApplicationRecord
  belongs_to :semester
  belongs_to :course
  belongs_to :user
  has_many :student_sections
  has_many :users, :through => :student_sections
#<<<<<<< HEAD
  has_many :courses, :through => :student_sections
#=======
  #sections are taught by instructors
#>>>>>>> 1f6b6a7f9d37991b451b7fe83c07dbb67988fd31
  
  #TODO: return students enrolled in this section
  def students # Want: student id and student names on Users Table
   #return Section.Users.where(:users => )  #joins(:users).where(:users => {:id => self.id}).id
    return Section.joins(:users).where(:users => {:id => self.id}).all
  
  end
  
  #TODO: return instructor for this section
  def instructor #want to return the instructor id and name from the users table
   # return Users.Section.where(:users.id => :section.id)
    return Users.joins(:section).where(:users => {:id => :section.user_id})
#"SELECT U.instructor_id, U.instructor_name FROM Section S INNER JOIN Users U ON S.user_id = U.USER_id;"
  end
  
  #TODO: return semseter for this section
  def semester
    return Section.where(semester_id: self.id)
  end
  
end
