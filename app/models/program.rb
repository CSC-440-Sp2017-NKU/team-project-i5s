class Program < ApplicationRecord
  has_many :courses
  validates :program_name, presence: true
end
