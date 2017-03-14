class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

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

def score
  return 0
end

def author
    return User.find(self.user_id).user_name
end

end
