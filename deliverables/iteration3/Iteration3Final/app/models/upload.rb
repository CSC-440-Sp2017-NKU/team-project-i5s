class Upload < ApplicationRecord
  def self.upload(import_file)
    require 'csv'
    
    CSV.foreach(import_file.path, headers:true) do |row|
      if !row['academic_year'].nil?
        @semester = get_semester_id(row['academic_year'], row['session'])
      end
      if !row['program_name'].nil?
        @program = get_program_id(row['program_name'])
      end
      if !row['course_name'].nil?
        @course = get_course_id(row['course_name'], @program_id)
      end
      if !row['instructor_name'].nil?
        @instructor = get_user_id(row['instructor_name'], row['instructor_email'], 3)
      end
      if !row['section_name'].nil?
        @section = get_section_id(row['section_name'], @semester, @course, @instructor)
      end
      if !row['student_name'].nil?
        @student = get_user_id(row['student_name'], row['student_email'], 2)
        @student_section = get_student_section_id(@student, @section, @course)
      end
      #puts @semester
      #puts @program
      #puts @course
      #puts @instructor
      #puts @section
      #puts @student
      #puts @student_section
    end
  end
  
  private
  
  #get semester_id from Semester if it exists or create it if it doesn't
  def self.get_semester_id(academic_year, session)
    semester = Semester.find_by(academic_year: academic_year, session: session)&.id
    if semester.nil?
      new_semester = Semester.new
      new_semester.academic_year = academic_year
      new_semester.session = session
      result = new_semester.save
      #puts result
      semester = new_semester.id
    end  
    return semester
  end
  
  #get program_id from Program
  def self.get_program_id(program_name)
    program = Program.find_by(program_name: program_name)&.id
    return program
  end
  
  #get course_id from Course if it exists or create it if it doesn't
  def self.get_course_id(course_name, program_id)
    course = Course.find_by(course_name: course_name)&.id
    if course.nil?
      new_course = Course.new
      new_course.course_name = course_name
      new_course.program_id = program_id
      result = new_course.save
      #puts result
      course = new_course.id
    end  
    return course
  end
  
  #get user_id from User if it exists or create it if it doesn't
  def self.get_user_id(name, email, role)
    user = User.find_by(user_name: name)&.id
    if user.nil?
      new_user = User.new
      new_user.user_name = name
      new_user.email = email
      new_user.password = "12345678"
      new_user.password_confirmation = "12345678"
      new_user.role_id = role
      result = new_user.save
      #puts result
      user = new_user.id
    end  
    return user
  end
  
  #get section_id from Section if it exists or create it if it doesn't
  def self.get_section_id(section_name, semester, course, instructor)
    section = Section.find_by(section_name: section_name, semester_id: semester, course_id: course)&.id
    if section.nil?
      new_section = Section.new
      new_section.section_name = section_name
      new_section.semester_id = semester
      new_section.course_id = course
      new_section.user_id = instructor
      result = new_section.save
      #puts result
      section = new_section.id
    end  
    return section
  end
  
  #get student_section_id from Student_Section if it exists or create it if it doesn't
  def self.get_student_section_id(student, section, course)
    student_section = StudentSection.find_by(user_id: student, section_id: section, course_id: course)&.id
    if student_section.nil?
      new_student_section = StudentSection.new
      new_student_section.user_id = student
      new_student_section.section_id = section
      new_student_section.course_id = course
      result = new_student_section.save
      #puts result
      student_section = new_student_section.id
    end  
    return student_section
  end
end