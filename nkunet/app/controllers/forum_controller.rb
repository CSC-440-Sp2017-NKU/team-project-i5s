class ForumController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def index
    @popQs = []
    @popQs.push Question.new
    @popQs[0].forum = "CSC"
    @popQs[0].title = "What is a computer?"
    @popQs[0].author = "Stuart Pid"
    @popQs[0].created_on = "1/15/2017 11:43PM"
    @popQs[0].num_answers = 50
    
     @popQs.push Question.new
    @popQs[1].forum = "BIO"
    @popQs[1].title = "How do I raise bees?"
    @popQs[1].author = "Abby Smith"
    @popQs[1].created_on = "3/5/2017 3:27AM"
    @popQs[1].num_answers = 2
    
    @forums = []
    @forums.push Forum.new
    @forums[0].id = 0
    @forums[0].name = "ART"
    @forums[0].image = "icons/art_icon.svg"
    
    @forums.push Forum.new
    @forums[1].id = 1
    @forums[1].name = "BIO"
     @forums[1].image = "icons/bio_icon.svg"
     
     @forums.push Forum.new
    @forums[2].id = 2
    @forums[2].name = "CHE"
     @forums[2].image = "icons/che_icon.svg"
     
     @forums.push Forum.new
    @forums[3].id = 3
    @forums[3].name = "CSC"
     @forums[3].image = "icons/csc_icon.svg"
  end
  
  def list_forums
  end
  
  def view_forum
  end
  
end

class Question
    attr_accessor :forum, :title, :author, :created_on, :num_answers
end

class Forum
  attr_accessor :name, :id, :image
end
