class User < ApplicationRecord
  belongs_to :role
  has_many :student_sections
  has_many :sections
  acts_as_authentic do |c|
  c.login_field = 'email'
  end
  
  #gathers the user's reputation
  ## of questions, # of answers, # of up-votes, # of down-votes
  def reputation
    # return the street cred...
    #lookup the DB data.
    questions = Question.where(user_id: self.id, active: true).count
    answers = Answer.where(user_id: self.id, active: true).count
    upvotes = Answer.where(user_id: self.id, active: true).joins(:votes).where(:votes => {:direction => 1}).count
    downvotes = Answer.where(user_id: self.id, active: true).joins(:votes).where(:votes => {:direction => -1}).count
    return {:num_questions => questions, :num_answers => answers, :up_votes => upvotes, :down_votes => downvotes}
  end
  
  #return the top 5 recent, visible answers back
  def recent_answers
    return Answer.where(user_id: self.id, active: true).order("created_at DESC").limit(5)
  end
  
  #return the top 5 recent, visible questions back
  def recent_questions
    return Question.where(user_id: self.id, active: true).order("created_at DESC").limit(5)
  end
  
  #return the classes the user is currently enrolled in.
  def classes
    #Course.includes(:sections => [:users]).where(:users => {:id => self.id}).all
    #Course.joins(:sections => :users).where(:users => {:id => self.id}).all
    Course.joins(:users).where(:users => {:id => self.id}).all.uniq
  end
  
  # returns whether or not the user is an admin!?
  def admin?()
    return self.role_id == Role.find_by(role: "Administrator").id #Role.find()
  end

end