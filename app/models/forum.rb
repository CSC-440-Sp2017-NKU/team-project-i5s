class Forum < ApplicationRecord
#attr_accessor :forum_name, :forum_description
  has_many :question
  
  #we want the most popular, but for now it's the most recent 5
  def most_popular_questions
     @questions = Question.order(:created_at).first(5)
  end 

#def initialize(attributes = {})
#@forum_name = attributes[:forum_name]
#@forum_description = attributes[:forum_description]
#end
#class Forum < ActiveRecord::Base
end
