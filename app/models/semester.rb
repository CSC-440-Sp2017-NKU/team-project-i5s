class Semester < ApplicationRecord
  belongs_to :section
  has_many :users, :through => :sections
  has_many :courses, :through => :sections
  validates :academic_year, presence: true
  validates :session, presence: true
end
