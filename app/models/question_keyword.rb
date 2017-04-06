class QuestionKeyword < ApplicationRecord
  belongs_to :question
  belongs_to :keyword
end
