class Vote < ApplicationRecord
  belongs_to :answers, foreign_key: 'answers'
  belongs_to :user
  #validates :direction, presence: true
  #
end
