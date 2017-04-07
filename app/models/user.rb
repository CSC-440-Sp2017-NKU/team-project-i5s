class User < ApplicationRecord
  belongs_to :role
  acts_as_authentic do |c|
  c.login_field = 'email'
  end
  
  # TODO : 
  #gathers the user's reputation
  ## of questions, # of answers, # of up-votes, # of down-votes
  def reputation
    # return the street cred...
    #lookup the DB data.
    questions = Question.where(user_id: self.id).count
    answers = Answer.where(user_id: self.id).count
    upvotes = Answer.joins(:votes).where('answer.user_id = self.id', 'vote.direction = +1').count
    downvotes = Answer.joins(:votes).where('answer.user_id = self.id', 'vote.direction = -1').count
    return {:num_questions => questions, :num_answers => answers, :up_votes => upvotes, :down_votes => downvotes}
  end
  
  # TODO : 
  #return the top 5 recent, visible answers back
  def recent_answers
    
  end
  
  # TODO : 
  #return the top 5 recent, visible questions back
  def recent_questions
    
  end
  
  # TODO : 
  #return the classes the user is currently enrolled in.
  def classes
    #Classes.find(me.id)
  end
  
  
  
  
  # returns whether or not hte user is an admin!?
  def admin?()
    return User.role == 0 #Role.find()
  end

  
end
