class Section < ApplicationRecord
  belongs_to :semester
  belongs_to :course
  belongs_to :user
  has_many :student_sections
  has_many :users, :through => :student_sections
  has_many :courses, :through => :student_sections
  has_one :users
  #sections are taught by instructors
  
  #TODO: return students enrolled in this section
  def students # Want: student id and student names on Users Table
   #return Section.Users.where(:users => )  #joins(:users).where(:users => {:id => self.id}).id
    #return Section.joins(:users).where(:users => {:id => self.id}).all
    #return User.where(:id => 1)
    #return User.joins(:student_sections).where(:student_sections.user_id => 14) #where(:sections => {:id => :student_section.section_id}, :users => {:id => :student_section.user_id}) #
    #User.joins(:sections).where(:users => {:id => student_sections.@user_id} and :student_section => {:id => self.id}).all
    User.joins(:sections).where(:sections => {:id => self.id}).all
    #Course.joins(:users).where(:users => {:id => self.id}).all.uniq
  end
  
  #TODO: return instructor for this section
  def instructor #want to return the instructor id and name from the users table
   # return Users.Section.where(:users.id => :section.id)
    return User.where('id = 14').first
    #return User.joins(Section).where(:users => {:id => self.user_id})
#"SELECT U.instructor_id, U.instructor_name FROM Section S INNER JOIN Users U ON S.user_id = U.USER_id;"
  end
  
  #TODO: return semseter for this section
  def semester
    return Section.where(semester_id: self.id)
  end
  
end
