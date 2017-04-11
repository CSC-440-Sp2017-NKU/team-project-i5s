##  db/seeds.rb
#%%%%%% NEW: 04/06/2017  #%%%%%% 
##

#rails generate model Role role:string
Role.destroy_all
Role.create!([
{role: "Administrator"}, 
{role: "Student"}, 
{role: "Faculty"},
{role: "Registrar"}
])
p "Created #{Role.count} roles"
p "Roles: #{Role.pluck :id}" 



#rails generate model User user_name:string password:string role:references   #change migration script::> t.intger :role_id, :default => 2
User.destroy_all
User.create!([ 
{user_name: "Test", email:"test@test.com", password: "12345678", password_confirmation: "12345678", role_id:2},
{user_name: "Hermoine Granger", email:"hermoine@test.com", password: "12345678", password_confirmation: "12345678", role_id:2},
{user_name: "Harry Potter", email:"harry@test.com", password: "12345678", password_confirmation: "12345678", role_id:2},
{user_name: "Scott Summers", email:"scott@test.com", password: "12345678", password_confirmation: "12345678", role_id:2},
{user_name: "Lisa Simpson", email:"lisa@test.com", password: "12345678", password_confirmation: "12345678", role_id:2},
{user_name: "Stu1", email:"stu1@test.com", password: "12345678", password_confirmation: "12345678", role_id:2},
{user_name: "Stu2", email:"stu2@test.com", password: "12345678", password_confirmation: "12345678", role_id:2},
{user_name: "Stu3", email:"stu3@test.com", password: "12345678", password_confirmation: "12345678", role_id:2},
{user_name: "Stu4", email:"stu4@test.com", password: "12345678", password_confirmation: "12345678", role_id:2},
{user_name: "Stu5", email:"stu5@test.com", password: "12345678", password_confirmation: "12345678", role_id:2},
{user_name: "Stu6", email:"stu6@test.com", password: "12345678", password_confirmation: "12345678", role_id:2},
{user_name: "Stu7", email:"stu7@test.com", password: "12345678", password_confirmation: "12345678", role_id:2},
{user_name: "Stu8", email:"stu8@test.com", password: "12345678", password_confirmation: "12345678", role_id:2},
{user_name: "Fac1", email:"fac1@test.com", password: "12345678", password_confirmation: "12345678", role_id:3},
{user_name: "Fac2", email:"fac2@test.com", password: "12345678", password_confirmation: "12345678", role_id:3},
{user_name: "Fac3", email:"fac3@test.com", password: "12345678", password_confirmation: "12345678", role_id:3},
{user_name: "Fac4", email:"fac4@test.com", password: "12345678", password_confirmation: "12345678", role_id:3},
{user_name: "Fac5", email:"fac5@test.com", password: "12345678", password_confirmation: "12345678", role_id:3},
{user_name: "Fac6", email:"fac6@test.com", password: "12345678", password_confirmation: "12345678", role_id:3},
{user_name: "Fac7", email:"fac7@test.com", password: "12345678", password_confirmation: "12345678", role_id:3},
{user_name: "Fac8", email:"fac8@test.com", password: "12345678", password_confirmation: "12345678", role_id:3},
{user_name: "Test Admin", email:"admin@test.com", password: "12345678", password_confirmation: "12345678", role_id:1},
{user_name: "Reg1", email:"reg1@test.com", password: "12345678", password_confirmation: "12345678", role_id:4}
])
p "Created #{User.count} users"
p "Users: #{User.pluck :id}" 


#rails generate model Forum forum_name:string forum_description:string resource_url:string
Forum.destroy_all
Forum.create!([
{forum_name:"ART", forum_description:"art is fine."},
{forum_name:"BIO", forum_description:"bio is fine."},
{forum_name:"CHE", forum_description:"che is fine."},
{forum_name:"CSC", forum_description:"csc is fine."},
{forum_name:"ENG", forum_description:"eng is fine."},
{forum_name:"MAT", forum_description:"mat is fine."}
])
p "Created #{Forum.count} forums"
p "Forums: #{Forum.pluck :id}" 


#rails generate model Question title:string text:string active:boolean user:references forum:references  #change migration script::> t.boolean :active, :default => true
Question.destroy_all
 Question.create!([{title:"How many cups of sugar does it take to get to the moon?", text:"First: Space. Second: Sugar. Third: Moon.", active:true, user_id:7, forum_id:1},
 {title:"How do I recognize a coral snake?", text:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nulla nibh, pulvinar euismod molestie id, maximus non felis. Pellentesque faucibus egestas magna, non molestie mauris. Aliquam maximus lectus tortor, sit amet gravida nibh rhoncus nec. Aenean imperdiet non orci sed condimentum. Suspendisse ligula nulla, dapibus fringilla ipsum eget, tempus imperdiet libero. Vestibulum non lectus at lorem fermentum lacinia vestibulum et nisl. Praesent cursus orci lorem, vestibulum hendrerit metus posuere id. Integer congue tellus euismod, maximus nisl eget, porta velit. Etiam nec bibendum lectus. Praesent elementum sapien id velit iaculis scelerisque ut a dui.", active:true, user_id:4, forum_id:3},
 {title:"What is the difference between C and C++?", text:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nulla nibh, pulvinar euismod molestie id, maximus non felis. Pellentesque faucibus egestas magna, non molestie mauris. Aliquam maximus lectus tortor, sit amet gravida nibh rhoncus nec. Aenean imperdiet non orci sed condimentum. Suspendisse ligula nulla, dapibus fringilla ipsum eget, tempus imperdiet libero. Vestibulum non lectus at lorem fermentum lacinia vestibulum et nisl. Praesent cursus orci lorem, vestibulum hendrerit metus posuere id. Integer congue tellus euismod, maximus nisl eget, porta velit. Etiam nec bibendum lectus. Praesent elementum sapien id velit iaculis scelerisque ut a dui.", active:true, user_id:1, forum_id:1},
 {title:"Corem ipsum dolor sit amet.", text:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nulla nibh, pulvinar euismod molestie id, maximus non felis. Pellentesque faucibus egestas magna, non molestie mauris. Aliquam maximus lectus tortor, sit amet gravida nibh rhoncus nec. Aenean imperdiet non orci sed condimentum. Suspendisse ligula nulla, dapibus fringilla ipsum eget, tempus imperdiet libero. Vestibulum non lectus at lorem fermentum lacinia vestibulum et nisl. Praesent cursus orci lorem, vestibulum hendrerit metus posuere id. Integer congue tellus euismod, maximus nisl eget, porta velit. Etiam nec bibendum lectus. Praesent elementum sapien id velit iaculis scelerisque ut a dui.", active:true, user_id:2, forum_id:2},
 {title:"Who is stealing my water?", text:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nulla nibh, pulvinar euismod molestie id, maximus non felis. Pellentesque faucibus egestas magna, non molestie mauris. Aliquam maximus lectus tortor, sit amet gravida nibh rhoncus nec. Aenean imperdiet non orci sed condimentum. Suspendisse ligula nulla, dapibus fringilla ipsum eget, tempus imperdiet libero. Vestibulum non lectus at lorem fermentum lacinia vestibulum et nisl. Praesent cursus orci lorem, vestibulum hendrerit metus posuere id. Integer congue tellus euismod, maximus nisl eget, porta velit. Etiam nec bibendum lectus. Praesent elementum sapien id velit iaculis scelerisque ut a dui.", active:true, user_id:3, forum_id:1},
 {title:"This is a really really long question title to test how overflow works when question stitles get really long. That wasn't long enough. I mean seriosuly long. What does it look like?", text:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nulla nibh, pulvinar euismod molestie id, maximus non felis. Pellentesque faucibus egestas magna, non molestie mauris. Aliquam maximus lectus tortor, sit amet gravida nibh rhoncus nec. Aenean imperdiet non orci sed condimentum. Suspendisse ligula nulla, dapibus fringilla ipsum eget, tempus imperdiet libero. Vestibulum non lectus at lorem fermentum lacinia vestibulum et nisl. Praesent cursus orci lorem, vestibulum hendrerit metus posuere id. Integer congue tellus euismod, maximus nisl eget, porta velit. Etiam nec bibendum lectus. Praesent elementum sapien id velit iaculis scelerisque ut a dui.", active:true, user_id:4, forum_id:2}])
p "Created #{Question.count} questions"
p "Questions: #{Question.pluck :id}" 



#rails generate model Answer text:string active:boolean user:references question:references   #change migration script::> t.boolean :active, :default => true
Answer.destroy_all
 Answer.create!([
 {text:"Corem ipsum dolor sit amet.", question_id:1, active:true, user_id:3},
 {text:"Corem ipsum dolor sit amet.", question_id:1, active:true, user_id:6},
 {text:"Corem ipsum dolor sit amet.", question_id:2, active:true, user_id:7},
 {text:"Corem ipsum dolor sit amet.", question_id:3, active:true, user_id:3},
 {text:"Corem ipsum dolor sit amet.", question_id:4, active:true, user_id:5},
 {text:"Corem ipsum dolor sit amet.", question_id:5, active:true, user_id:2}
])
p "Created #{Answer.count} answers"
p "Answers: #{Answer.pluck :id}" 


case Rails.env
  when "development" # DEVELOPMENT :: SQL LITE
    #ActiveRecord::Base.connection.execute('CREATE UNIQUE INDEX uq_idx_one_vote_per_answer_user ON VOTES (answers_id, user_id);') 
	
  when "production" # PRODUCTION :: PostGRE
   # ActiveRecord::Base.connection.execute('CREATE UNIQUE INDEX uq_idx_one_vote_per_answer_user ON VOTES (answers_id, user_id);')
end



#rails generate model Votes direction:integer answers:references user:references #modify database w/   
Vote.destroy_all
Vote.create!([
{answers_id: 4, user_id: 9, direction:-1},
{answers_id: 4, user_id: 1, direction:-1},
{answers_id: 4, user_id: 2, direction:-1},
{answers_id: 4, user_id: 3, direction:-1},
{answers_id: 4, user_id: 4, direction:-1},
{answers_id: 4, user_id: 5, direction:-1},
{answers_id: 4, user_id: 6, direction:-1},
{answers_id: 4, user_id: 7, direction:-1},
{answers_id: 4, user_id: 8, direction:-1},
{answers_id: 1, user_id: 9, direction:1},
{answers_id: 1, user_id: 1, direction:1},
{answers_id: 1, user_id: 2, direction:1},
{answers_id: 1, user_id: 3, direction:1},
{answers_id: 1, user_id: 4, direction:1},
{answers_id: 1, user_id: 5, direction:1},
{answers_id: 1, user_id: 6, direction:1},
{answers_id: 1, user_id: 7, direction:1},
{answers_id: 1, user_id: 8, direction:1},
{answers_id: 2, user_id: 9, direction:-1},
{answers_id: 2, user_id: 1, direction:-1},
{answers_id: 2, user_id: 2, direction:1},
{answers_id: 2, user_id: 3, direction:1},
{answers_id: 2, user_id: 4, direction:1},
{answers_id: 2, user_id: 5, direction:1},
{answers_id: 2, user_id: 6, direction:1},
{answers_id: 2, user_id: 7, direction:-1},
{answers_id: 2, user_id: 8, direction:-1},
{answers_id: 3, user_id: 9, direction:-1},
{answers_id: 3, user_id: 1, direction:-1},
{answers_id: 3, user_id: 2, direction:1},
{answers_id: 3, user_id: 3, direction:1},
{answers_id: 3, user_id: 4, direction:1},
{answers_id: 3, user_id: 5, direction:1},
{answers_id: 3, user_id: 6, direction:-1},
{answers_id: 3, user_id: 7, direction:-1}
])
p "Created #{Vote.count} votes"
p "Votes: #{Vote.pluck :id}" 

#rails generate model Keyword keyword:string 
Keyword.destroy_all
Keyword.create!([
	{keyword: "american literature"},
	{keyword: "ancient history"},
	{keyword: "oil painting"},
	{keyword: "water painting"},
	{keyword: "clay sculpting"},
	{keyword: "genetics"},
	{keyword: "INF120"},
	{keyword: "CSC440"},
	{keyword: "CSC485"},
	{keyword: "HIS323"},
	{keyword: "ART202"},
	{keyword: "ART409"},
	{keyword: "data structures"},
	{keyword: "algorithms"},
	{keyword: "astronomy"},
	{keyword: "neweton"},
	{keyword: "pascal"},
	{keyword: "philosophy"},
	{keyword: "zen"},
	{keyword: "software maintenance"},
	{keyword: "visual design"},
	{keyword: "psychology"},
	{keyword: "newton's second law"},
	{keyword: "calculus"},
	{keyword: "geometry"},
	{keyword: "algebra"}
])
p "Created #{Keyword.count} keywords"
p "Keywords: #{Keyword.pluck :id}" 



#rails generate model QuestionKeyword question:references keyword:references
QuestionKeyword.destroy_all
QuestionKeyword.create!([
{question_id:1, keyword_id:1 },
{question_id:1, keyword_id:2 },
{question_id:1, keyword_id:24 },
{question_id:1, keyword_id:4 },
{question_id:1, keyword_id:25 },
{question_id:1, keyword_id:23 },
{question_id:1, keyword_id:17 },
{question_id:1, keyword_id:8 },
{question_id:2, keyword_id:3 },
{question_id:2, keyword_id:2 },
{question_id:2, keyword_id:16 },
{question_id:3, keyword_id:20 },
{question_id:3, keyword_id:3 },
{question_id:3, keyword_id:8 },
{question_id:3, keyword_id:9 },
{question_id:3, keyword_id:10 },
{question_id:4, keyword_id:11 },
{question_id:4, keyword_id:12 }
])
p "Created #{QuestionKeyword.count} QuestionKeywords"
p "Keywords: #{QuestionKeyword.pluck :id}" 



#rails generate model Semester academic_year:integer session:string
Semester.destroy_all
Semester.create!([
{academic_year:2016, session: "Fall"},
{academic_year:2016, session: "Spring"},
{academic_year:2016, session: "Summer"},
{academic_year:2016, session: "Winter"},
{academic_year:2017, session: "Fall"},
{academic_year:2017, session: "Spring"},
{academic_year:2017, session: "Summer"},
{academic_year:2017, session: "Winter"},
{academic_year:2015, session: "Fall"},
{academic_year:2015, session: "Spring"},
{academic_year:2015, session: "Summer"},
{academic_year:2015, session: "Winter"}
])
p "Created #{Semester.count} Semesters"
p "Keywords: #{Semester.pluck :id}" 



#rails generate model Program program_name:string
Program.destroy_all
Program.create!([
{program_name:"Computer Science"},
{program_name:"Mathematics"},
{program_name:"Chemistry"},
{program_name:"Biology"},
{program_name:"History"},
{program_name:"Political Science"},
{program_name:"Art"},
{program_name:"English"},
{program_name:"French"},
{program_name:"German"},
{program_name:"Business"},
{program_name:"Statistics"}
])
p "Created #{Program.count} Programs"
p "Keywords: #{Program.pluck :id}" 




#rails generate model Course course_name:string program:references
Course.destroy_all
Course.create!([
{course_name: "CSC440", program_id:1},
{course_name: "CSC430", program_id:1},
{course_name: "CSC402", program_id:1},
{course_name: "CSC282", program_id:1},
{course_name: "CSC250", program_id:1},
{course_name: "CSC360", program_id:1},
{course_name: "CSC362", program_id:1},
{course_name: "CSC364", program_id:1},
{course_name: "MAT440", program_id:2},
{course_name: "MAT430", program_id:2},
{course_name: "MAT402", program_id:2},
{course_name: "MAT282", program_id:2},
{course_name: "MAT250", program_id:2},
{course_name: "MAT360", program_id:2},
{course_name: "MAT362", program_id:2},
{course_name: "MAT364", program_id:2},
{course_name: "CHE440", program_id:3},
{course_name: "CHE430", program_id:3},
{course_name: "CHE402", program_id:3},
{course_name: "CHE282", program_id:3},
{course_name: "CHE250", program_id:3},
{course_name: "CHE360", program_id:3},
{course_name: "CHE362", program_id:3},
{course_name: "CHE364", program_id:3},
{course_name: "BIO440", program_id:4},
{course_name: "BIO430", program_id:4},
{course_name: "BIO402", program_id:4},
{course_name: "BIO282", program_id:4},
{course_name: "BIO250", program_id:4},
{course_name: "BIO360", program_id:4},
{course_name: "BIO362", program_id:4},
{course_name: "BIO364", program_id:4},
{course_name: "HIS440", program_id:5},
{course_name: "HIS430", program_id:5},
{course_name: "HIS402", program_id:5},
{course_name: "HIS282", program_id:5},
{course_name: "HIS250", program_id:5},
{course_name: "HIS360", program_id:5},
{course_name: "HIS362", program_id:5},
{course_name: "HIS364", program_id:5},
{course_name: "PSC440", program_id:6},
{course_name: "PSC430", program_id:6},
{course_name: "PSC402", program_id:6},
{course_name: "PSC282", program_id:6},
{course_name: "PSC250", program_id:6},
{course_name: "PSC360", program_id:6},
{course_name: "PSC362", program_id:6},
{course_name: "PSC364", program_id:6},
{course_name: "ART440", program_id:7},
{course_name: "ART430", program_id:7},
{course_name: "ART402", program_id:7},
{course_name: "ART282", program_id:7},
{course_name: "ART250", program_id:7},
{course_name: "ART360", program_id:7},
{course_name: "ART362", program_id:7},
{course_name: "ART364", program_id:7},
{course_name: "ENG440", program_id:8},
{course_name: "ENG430", program_id:8},
{course_name: "ENG402", program_id:8},
{course_name: "ENG282", program_id:8},
{course_name: "ENG250", program_id:8},
{course_name: "ENG360", program_id:8},
{course_name: "ENG362", program_id:8},
{course_name: "ENG364", program_id:8},
{course_name: "FRE440", program_id:9},
{course_name: "FRE430", program_id:9},
{course_name: "FRE402", program_id:9},
{course_name: "FRE282", program_id:9},
{course_name: "FRE250", program_id:9},
{course_name: "FRE360", program_id:9},
{course_name: "FRE362", program_id:9},
{course_name: "FRE364", program_id:9},
{course_name: "GER440", program_id:10},
{course_name: "GER430", program_id:10},
{course_name: "GER402", program_id:10},
{course_name: "GER282", program_id:10},
{course_name: "GER250", program_id:10},
{course_name: "GER360", program_id:10},
{course_name: "GER362", program_id:10},
{course_name: "GER364", program_id:10},
{course_name: "BUS440", program_id:11},
{course_name: "BUS430", program_id:11},
{course_name: "BUS402", program_id:11},
{course_name: "BUS282", program_id:11},
{course_name: "BUS250", program_id:11},
{course_name: "BUS360", program_id:11},
{course_name: "BUS362", program_id:11},
{course_name: "BUS364", program_id:11},
{course_name: "STA440", program_id:12},
{course_name: "STA430", program_id:12},
{course_name: "STA402", program_id:12},
{course_name: "STA282", program_id:12},
{course_name: "STA250", program_id:12},
{course_name: "STA360", program_id:12},
{course_name: "STA362", program_id:12},
{course_name: "STA364", program_id:12}
])
p "Created #{Course.count} Courses"
p "Keywords: #{Course.pluck :id}" 



#rails generate model Section semester:references course:references user:references
Section.destroy_all
Section.create!([
{semester_id:1, course_id:1, user_id:14},
{semester_id:2, course_id:1, user_id:15},
{semester_id:3, course_id:1, user_id:16},
{semester_id:4, course_id:1, user_id:17},
{semester_id:5, course_id:1, user_id:18},
{semester_id:6, course_id:1, user_id:19},
{semester_id:7, course_id:1, user_id:20},
{semester_id:8, course_id:1, user_id:21},
])
p "Created #{Section.count} Semesters"
p "Keywords: #{Section.pluck :id}" 



#rails generate model StudentSection user:references section:references course:references
StudentSection.destroy_all
StudentSection.create!([
{section_id:1, course_id:1, user_id:1},
{section_id:1, course_id:1, user_id:2},
{section_id:1, course_id:1, user_id:3},
{section_id:1, course_id:1, user_id:4},
{section_id:1, course_id:1, user_id:5},
{section_id:1, course_id:1, user_id:6},
{section_id:1, course_id:1, user_id:7},
{section_id:1, course_id:1, user_id:8},
{section_id:1, course_id:1, user_id:9},
{section_id:2, course_id:1, user_id:10},
{section_id:2, course_id:1, user_id:11},
{section_id:2, course_id:1, user_id:12},
{section_id:2, course_id:1, user_id:4},
{section_id:2, course_id:1, user_id:5},
{section_id:2, course_id:1, user_id:6},
{section_id:2, course_id:1, user_id:7},
{section_id:2, course_id:1, user_id:8},
{section_id:2, course_id:1, user_id:9},
{section_id:3, course_id:3, user_id:3},
{section_id:3, course_id:3, user_id:2},
{section_id:3, course_id:3, user_id:3},
{section_id:3, course_id:3, user_id:4},
{section_id:3, course_id:3, user_id:5},
{section_id:3, course_id:3, user_id:6},
{section_id:3, course_id:3, user_id:7},
{section_id:3, course_id:3, user_id:8},
{section_id:3, course_id:3, user_id:9},
{section_id:4, course_id:4, user_id:1},
{section_id:4, course_id:4, user_id:2},
{section_id:4, course_id:4, user_id:3},
{section_id:4, course_id:4, user_id:4},
{section_id:4, course_id:4, user_id:5},
{section_id:4, course_id:4, user_id:6},
{section_id:4, course_id:4, user_id:7},
{section_id:4, course_id:4, user_id:8},
{section_id:4, course_id:4, user_id:9},
{section_id:5, course_id:4, user_id:1},
{section_id:5, course_id:6, user_id:2},
{section_id:5, course_id:6, user_id:3},
{section_id:5, course_id:6, user_id:4},
{section_id:5, course_id:6, user_id:5},
{section_id:5, course_id:6, user_id:6},
{section_id:5, course_id:6, user_id:7},
{section_id:5, course_id:6, user_id:8},
{section_id:5, course_id:6, user_id:9},
{section_id:5, course_id:4, user_id:1},
{section_id:5, course_id:6, user_id:2},
{section_id:5, course_id:6, user_id:3},
{section_id:5, course_id:6, user_id:4},
{section_id:5, course_id:6, user_id:5},
{section_id:5, course_id:6, user_id:6},
{section_id:5, course_id:6, user_id:7},
{section_id:5, course_id:6, user_id:8},
{section_id:5, course_id:6, user_id:9},
{section_id:6, course_id:1, user_id:3},
{section_id:6, course_id:1, user_id:4},
{section_id:6, course_id:1, user_id:5},
{section_id:6, course_id:1, user_id:6},
{section_id:6, course_id:1, user_id:7},
{section_id:6, course_id:1, user_id:8},
{section_id:6, course_id:1, user_id:9},
{section_id:7, course_id:1, user_id:10},
{section_id:7, course_id:1, user_id:11},
{section_id:7, course_id:1, user_id:12},
{section_id:7, course_id:1, user_id:4},
{section_id:7, course_id:1, user_id:5},
{section_id:7, course_id:1, user_id:6},
{section_id:7, course_id:1, user_id:7},
{section_id:7, course_id:1, user_id:8},
{section_id:7, course_id:1, user_id:9},
{section_id:8, course_id:3, user_id:3},
{section_id:8, course_id:3, user_id:2},
{section_id:8, course_id:3, user_id:3}
])
p "Created #{StudentSection.count} StudentSection"
p "Keywords: #{StudentSection.pluck :id}" 
