class User < ApplicationRecord
  belongs_to :role
  acts_as_authentic do |c|
  c.login_field = 'email'
  end
  
  # returns whether or not hte user is an admin!?
  def admin?()
    return User.role == 0
  end

  
end
