
  class Question
    attr_accessor :id, :forum, :title, :author, :created_on, :num_answers, :description, :answers
  end

  class Forum
    attr_accessor :name, :id, :image
  end

class Answer
  attr_accessor :author, :text, :created_on, :score
end