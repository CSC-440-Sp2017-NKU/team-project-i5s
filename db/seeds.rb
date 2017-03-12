# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#[seed script]
#[https://davidmles.com/seeding-database-rails/]
#[http://guides.rubyonrails.org/association_basics.html]
#[rake db:drop db:migrate db:seed]
#[ p "Created #{User.count} users"]
#[ p "Created #{User.count} users"]

Role.destroy_all
 
Role.create!([
{role: "Administrator"},{role: "Student"},{role: "Faculty"}])
 
p "Created #{Role.count} roles"
p "Roles: #{Role.pluck :role_id}" 

User.destroy_all
 
User.create!([
{user_name: "Joe Deer", password: "password", role_id: 2},
{user_name: "Jane Deer", password: "password", role_id: 2},
{user_name: "Scott Summers", password: "password", role_id: 2},
{user_name: "Hermoine Granger", password: "password", role_id: 2},
{user_name: "Robert Plant", password: "password", role_id: 3},
{user_name: "Major Shake", password: "password", role_id: 3},
{user_name: "Eli Driver", password: "password", role_id: 3},
{user_name: "Beatrix Kiddo", password: "password", role_id: 3}])
 
p "Created #{User.count} users"
 p "Users: #{User.pluck :user_id}" 

Forum.destroy_all
Forum.create!([{forum_name:"ART", forum_description:"art is fine."},
{forum_name:"BIO", forum_description:"bio is fine."},
{forum_name:"CHE", forum_description:"che is fine."},
{forum_name:"CSC", forum_description:"csc is fine."}
])
p "Created #{Forum.count} forums"
p "Forums: #{Forum.pluck :forum_id}" 

Question.destroy_all
Question.create!([{question_title:"How many cups of sugar does it take to get to the moon?", question_description:"First: Space. Second: Sugar. Third: Moon.", active:true, user_id:7, forum_id:1},
{question_title:"How do I recognize a coral snake?", question_description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nulla nibh, pulvinar euismod molestie id, maximus non felis. Pellentesque faucibus egestas magna, non molestie mauris. Aliquam maximus lectus tortor, sit amet gravida nibh rhoncus nec. Aenean imperdiet non orci sed condimentum. Suspendisse ligula nulla, dapibus fringilla ipsum eget, tempus imperdiet libero. Vestibulum non lectus at lorem fermentum lacinia vestibulum et nisl. Praesent cursus orci lorem, vestibulum hendrerit metus posuere id. Integer congue tellus euismod, maximus nisl eget, porta velit. Etiam nec bibendum lectus. Praesent elementum sapien id velit iaculis scelerisque ut a dui.", active:true, user_id:4, forum_id:3},
{question_title:"What is the difference between C and C++?", question_description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nulla nibh, pulvinar euismod molestie id, maximus non felis. Pellentesque faucibus egestas magna, non molestie mauris. Aliquam maximus lectus tortor, sit amet gravida nibh rhoncus nec. Aenean imperdiet non orci sed condimentum. Suspendisse ligula nulla, dapibus fringilla ipsum eget, tempus imperdiet libero. Vestibulum non lectus at lorem fermentum lacinia vestibulum et nisl. Praesent cursus orci lorem, vestibulum hendrerit metus posuere id. Integer congue tellus euismod, maximus nisl eget, porta velit. Etiam nec bibendum lectus. Praesent elementum sapien id velit iaculis scelerisque ut a dui.", active:true, user_id:1, forum_id:1},
{question_title:"Corem ipsum dolor sit amet.", question_description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nulla nibh, pulvinar euismod molestie id, maximus non felis. Pellentesque faucibus egestas magna, non molestie mauris. Aliquam maximus lectus tortor, sit amet gravida nibh rhoncus nec. Aenean imperdiet non orci sed condimentum. Suspendisse ligula nulla, dapibus fringilla ipsum eget, tempus imperdiet libero. Vestibulum non lectus at lorem fermentum lacinia vestibulum et nisl. Praesent cursus orci lorem, vestibulum hendrerit metus posuere id. Integer congue tellus euismod, maximus nisl eget, porta velit. Etiam nec bibendum lectus. Praesent elementum sapien id velit iaculis scelerisque ut a dui.", active:true, user_id:2, forum_id:2},
{question_title:"Who is stealing my water?", question_description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nulla nibh, pulvinar euismod molestie id, maximus non felis. Pellentesque faucibus egestas magna, non molestie mauris. Aliquam maximus lectus tortor, sit amet gravida nibh rhoncus nec. Aenean imperdiet non orci sed condimentum. Suspendisse ligula nulla, dapibus fringilla ipsum eget, tempus imperdiet libero. Vestibulum non lectus at lorem fermentum lacinia vestibulum et nisl. Praesent cursus orci lorem, vestibulum hendrerit metus posuere id. Integer congue tellus euismod, maximus nisl eget, porta velit. Etiam nec bibendum lectus. Praesent elementum sapien id velit iaculis scelerisque ut a dui.", active:true, user_id:3, forum_id:1},
{question_title:"This is a really really long question title to test how overflow works when question stitles get really long. That wasn't long enough. I mean seriosuly long. What does it look like?", question_description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nulla nibh, pulvinar euismod molestie id, maximus non felis. Pellentesque faucibus egestas magna, non molestie mauris. Aliquam maximus lectus tortor, sit amet gravida nibh rhoncus nec. Aenean imperdiet non orci sed condimentum. Suspendisse ligula nulla, dapibus fringilla ipsum eget, tempus imperdiet libero. Vestibulum non lectus at lorem fermentum lacinia vestibulum et nisl. Praesent cursus orci lorem, vestibulum hendrerit metus posuere id. Integer congue tellus euismod, maximus nisl eget, porta velit. Etiam nec bibendum lectus. Praesent elementum sapien id velit iaculis scelerisque ut a dui.", active:true, user_id:4, forum_id:2}])
p "Created #{Question.count} questions"
p "Questions: #{Question.pluck :question_id}" 


Answer.destroy_all
Answer.create!([{answer:"Corem ipsum dolor sit amet.", question_id:1, active:true, user_id:3},
{answer:"Corem ipsum dolor sit amet.", question_id:1, active:true, user_id:6},
{answer:"Corem ipsum dolor sit amet.", question_id:2, active:true, user_id:7},
{answer:"Corem ipsum dolor sit amet.", question_id:3, active:true, user_id:3},
{answer:"Corem ipsum dolor sit amet.", question_id:4, active:true, user_id:5},
{answer:"Corem ipsum dolor sit amet.", question_id:5, active:true, user_id:2}])
p "Created #{Answer.count} answers"
p "Answers: #{Answer.pluck :answer_id}" 
