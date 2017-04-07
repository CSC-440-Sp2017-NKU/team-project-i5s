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
    street_cred = {:num_questions => 1, :num_answers => 1, :up_votes => 1, :down_votes => 1}
    street_cred
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
    return self.role_id == Role.find_by(role: "Administrator").id #Role.find()
  end

  
end
