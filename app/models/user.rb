class User < ApplicationRecord
  belongs_to :role
  acts_as_authentic do |c|
  c.login_field = 'email'

  end
end
