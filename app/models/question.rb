
class Question < ApplicationRecord
belongs_to :user
belongs_to :forum
has_many :answer
attr_accessor :question_title, :question_description, :forum_id, :user_id, :question_datetime

def initialize(attributes = {})
@question_title = attributes[:question_title]
@question_description = attributes[:question_description]
@forum_id = attributes[:forum_id]
@user_id = attributes[:user_id]
@question_datetime = attributes[:question_datetime]
end
end
