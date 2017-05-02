class Search < ApplicationRecord
    #search our database for questions
    #based on title, text, user name, keyword
    def self.search_questions
        #parms = {:title => "sugar"}
        return question_results #(parms)
    end
    
 #   def search_courses
#    end
    
    
private
    def question_results(parms)
        #questions :: subject, title, user, keyword
        #course :: name, instructor
        s_select_clause = " Q.* "
        s_from_clause = "QUESTION Q "
        where_elements = {"Q.ACTIVE = ?" => true}
        
        #build our sql string
        #if text.present? #subject
        #if parms.text.present?
          where_elements["instr(Q.TEXT, ?) > 0"] = "sugar" # parms[:text] #params[:text]
        #end
        
        #if title.present? #title
        if parms.title.present?
          where_elements["instr(Q.TITLE, ?) > 0"] = parms[:title] # params[:title]
        end 
        
       # if user_name.present? #user_name
        if parms.user_name.present?
          s_select_clause = s_select_clause + ", U.USER_NAME "
          s_from_clause = s_from_clause + "  INNER JOIN  USERS U  ON U.ID = Q.USER_ID "
          where_elements["U.USER_NAME like ?"] = parms[:user_name] #params[:user_name]
        end 
        
       # if keywords.present? #keyword
        if parms.keywords.present?
          s_select_clause = s_select_clause + ", K.KEYWORD "
          s_from_clause = s_from_clause + " LEFT JOIN  KEYWORD K  ON Q.ID = K.QUESTION_ID"
          where_elements["K.KEYWORD = ?"] = parms[:keyword] #params[:keyword]
        end
        
        
        ### build our complete call to question...  ###
        #http://api.rubyonrails.org/classes/ActiveRecord/Querying.html
        #Post.find_by_sql ["SELECT title FROM posts WHERE author = ? AND created > ?", author_id, start_date]
        #http://guides.rubyonrails.org/active_record_querying.html
        #https://www.youtube.com/watch?v=zltANfm0usY
        results = Search.find_by_sql("SELECT " + s_select_clause + " FROM " + s_from_clause) #return our basic search results (large)
        
        #whittle down our results with repeated calls to where.
        #this is safe -- ruby iterates over the collection based on the order in which they were added.
        where_elements.each { |key, value| 
          results = results + Search.where(key, value) # filter our Search results by the key/val where
        }
        
        results = results.order(:created_at) # return our results ordered by creation date/time
    end
    
   # def main_search_courses
        #course :: name, instructor
        # where_elements = {"Q.ACTIVE = ?" => true}
    #    s_select_clause = " C.* "
    #    s_from_clause = "COURSE C "
       
    #end
    
  #  s_select_c = "SELECT Q.* FROM QUESTIONS Q"
  #  Search.find_by_sql(s_select_c)
end