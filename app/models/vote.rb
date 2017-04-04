class Vote < ApplicationRecord
  belongs_to :answers
  belongs_to :user
end
