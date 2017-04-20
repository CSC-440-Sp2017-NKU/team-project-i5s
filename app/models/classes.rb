class Classes < ApplicationRecord
    
    has_many :students
    
    def students
    
    return Students.where(??)
    end
end