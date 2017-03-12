
class User < ApplicationRecord
attr_accessor :password, :user_name, :role_id
has_many :question
has_many :answer
def initialize(attributes = {})
@password = attributes[:password]
@user_name = attributes[:user_name]
@role_id = attributes[:role_id]
end
end