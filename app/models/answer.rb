#class Answer < ApplicationRecord
#  belongs_to :user
#  belongs_to :question
#end

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :votes, foreign_key: 'answers_id'
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
  return Vote.where(answers_id: self.id).sum(:direction)
  #@answer_score = 
  #return 0
end

def author
  return User.find(self.user_id).user_name
end

def user_vote (user)
  return Vote.find_by(answers_id: self.id, user_id: user.id)
end

end
