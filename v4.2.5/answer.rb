
class Answer < ApplicationRecord
belongs_to :user
belongs_to :question
attr_accessor :answer, :question_id, :user_id, :answer_datetime

def initialize(attributes = {})
@answer = attributes[:answer]
@question_id = attributes[:question_id]
@user_id = attributes[:user_id]
@answer_datetime = attributes[:answer_datetime]
end
end
