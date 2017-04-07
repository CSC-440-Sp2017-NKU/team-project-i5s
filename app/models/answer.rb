#class Answer < ApplicationRecord
#  belongs_to :user
#  belongs_to :question
#end

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  validates :text, presence: true
  validates :question_id, presence: true        
#class Answer < ApplicationRecord
#belongs_to :user
#belongs_to :question
#attr_accessor :answer, :question_id, :user_id, :answer_datetime

#def initialize(attributes = {})
#@answer = attributes[:answer]
#@question_id = attributes[:question_id]
#@user_id = attributes[:user_id]
#@answer_datetime = attributes[:answer_datetime]
#end

# TODO : 
def score
  #Post.select("posts.*, COUNT(comments.id) as comment_count").joins("LEFT OUTER JOIN comments ON (comments.post_id = posts.id)").group("posts.id")
Answer.select("answer.*, COUNT(user_id.id) as comment_count").joins("LEFT OUTER JOIN comments ON (answers.user_id = user_id.id)").group("user.id.id")  #Robert
#Answer.count('user_id')  #https://apidock.com/rails/ActiveRecord/Calculations/ClassMethods/count
  #if 
  #@answer_score = 
  return 0
end

def author
  return User.find(self.user_id).user_name
end

end
