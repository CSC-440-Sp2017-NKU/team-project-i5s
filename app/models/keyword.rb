class Keyword < ApplicationRecord
  #has_many :question_keywords
  #has_many :question, :through => :question_keywords
  validates :keyword, presence: true
end
