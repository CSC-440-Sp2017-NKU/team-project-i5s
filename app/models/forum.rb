#class Forum < ApplicationRecord
#end

class Forum < ApplicationRecord
#attr_accessor :forum_name, :forum_description
  has_many :question
  
  def questions
    return Question.where(forum_id: self.id, visible: true) 
  end

#def initialize(attributes = {})
#@forum_name = attributes[:forum_name]
#@forum_description = attributes[:forum_description]
#end
#class Forum < ActiveRecord::Base
end
