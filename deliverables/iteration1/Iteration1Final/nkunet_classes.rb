class Forum < ApplicationRecord
  attr_accessor :forum_name, :forum_description
  
  def initialize(attributes = {})
    @forum_name = attributes[:forum_name]
    @forum_description = attributes[:forum_description]
  end
end

class Question < ApplicationRecord
  attr_accessor :question_title, :question_description, :forum_id, :user_id, :question_datetime
  
  def initialize(attributes = {})
    @question_title = attributes[:question_title]
    @question_description = attributes[:question_description]
    @forum_id = attributes[:forum_id]
    @user_id = attributes[:user_id]
    @question_datetime = attributes[:question_datetime]
  end
end

class Answer < ApplicationRecord
  attr_accessor :answer, :question_id, :user_id, :answer_datetime
  
  def initialize(attributes = {})
    @answer = attributes[:answer]
    @question_id = attributes[:question_id]
    @user_id = attributes[:user_id]
    @answer_datetime = attributes[:answer_datetime]
  end
end

class User < ApplicationRecord
  attr_accessor :password, :user_name, :role_id
  
  def initialize(attributes = {})
    @password = attributes[:password]
    @user_name = attributes[:user_name]
    @role_id = attributes[:role_id]
  end
end