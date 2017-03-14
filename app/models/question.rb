class Question < ApplicationRecord
  belongs_to :user
  belongs_to :forum
  has_many :answer
  validates :question_title, presence: true
  validates :question_description, presence: true
  validates :forum_id, presence: true         
 # @forum_name = Forum.find_by()

  #return the associated forum name with the question object
  def forum_name
    return @forum_name = Forum.find(self.forum_id).forum_name
  end
  
  #lookup the author of the question
  def author
    return @forum_name = User.find(self.user_id).user_name
  end
  
  # return the associated answers
  def answers
    return Answer.find_all_by(question_id: self.question_id) 
  end

end