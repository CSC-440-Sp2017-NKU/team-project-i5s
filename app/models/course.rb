class Course < ApplicationRecord
  belongs_to :program
  has_many :sections
  has_many :student_sections
  has_many :users, :through => :student_sections
  has_many :sections, :through => :student_sections
  has_many :users, :through => :sections
  has_many :semesters, :through => :sections
  
  #TODO: return all sections of this course
  def sections
    return Section.where(course_id: self.id)
  end
  
  def self.upload(import_file)
    require 'csv'
      CSV.foreach(import_file.path, headers:true) do |row|
        #puts row
        #
        #@c = Course.new
        #@c.course_name = "VooDoo"
        #@c.save
        #
        @u = User.new
        @u.user_name = row['user_name']
        @u.email = row['email']
        @u.password = "12345678"
        @u.password_confirmation = "12345678"
        @u.role_id = row['role']
        result = @u.save
        puts result
        #
        @uid = User.find_by(email: row['email'])&.id
        puts @uid
        @uid2 = User.find_by(email: "notthere")&.id
        if @uid2.nil? 
          puts "nil" 
        else 
          puts @uid2 
        end
        #un = :user_name
        #puts un
        puts row['user_name']
        #@uid == User.select("id").where(user_name: :user_name)
      end
  end
  def user_id?
    return User.find_by(email: :email)&.id
  end
end

