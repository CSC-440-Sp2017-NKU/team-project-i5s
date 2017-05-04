class Search < ApplicationRecord
  
    def self.search_courses(query_criteria)
      #make sure we passing in values to the model
      #course :: name, instructor
      if !query_criteria.empty? and (query_criteria.has_key?(:course_instructor_name) or query_criteria.has_key?(:course_name))
        return course_results(query_criteria)
      else
        return []
      end
    end
    
    def self.search_questions(query_criteria)
      #make sure we passing in values to the model
      if !query_criteria.empty? and (query_criteria.has_key?(:question_user_name) or query_criteria.has_key?(:question_title) or query_criteria.has_key?(:question_subject) or query_criteria.has_key?(:question_keyword))
        return question_results(query_criteria)
      else
        return []
      end
    end

private
  def self.course_results(query_criteria)
    #query the DB for all questions/keywords/users
    #and whittle down the results  based on teh passed-in parameters
       #course :: name, instructor
        #COURSE  -> course_name
        #SECTION -> instructor_id
      #  USER id -> id, user_name

        sSQL = %{SELECT DISTINCT  
                   COURSES.ID as COURSE_ID, COURSES.COURSE_NAME, SECTIONS.ID as SECTION_ID, SECTIONS.USER_ID as COURSE_INSTRUCTOR_ID, USERS.USER_NAME as COURSE_INSTRUCTOR_NAME
                 FROM
                   COURSES
                   LEFT JOIN 
                   (SECTIONS 
                    INNER JOIN
                    USERS ON SECTIONS.USER_ID = USERS.ID 
                   ) ON COURSES.ID = SECTIONS.COURSE_ID
                }
                
        #build our where clause dynamically
        #course :: name, instructor
        if query_criteria.has_key?(:course_instructor_name) and query_criteria.has_key?(:course_name) 
          sWhere = "INSTR(USERS.USER_NAME, :course_instructor_name) > 0 AND INSTR(COURSES.COURSE_NAME, :course_name) > 0" if query_criteria.has_key?(:course_instructor_name)
           
        else
          sWhere = "INSTR(USERS.USER_NAME, :course_instructor_name) > 0" if query_criteria.has_key?(:course_instructor_name)
          sWhere = "INSTR(COURSES.COURSE_NAME, :course_name) > 0" if query_criteria.has_key?(:course_name) 
        end
        
        #return our results
    #this workeD!!!!
    #http://stackoverflow.com/questions/28367495/avoid-sql-injection-with-connection-execute
      query = sanitize_sql([sSQL + sWhere, query_criteria])
      return ActiveRecord::Base.connection.execute(query)
    end


    def self.question_results(query_criteria)
    #query the DB for all questions/keywords/users
    #and whittle down the results based on teh passed-in parameters
        sSQL = %{SELECT   
                  DISTINCT(QUESTIONS.ID) as QUESTION_ID, QUESTIONS.TITLE as QUESTION_TITLE, QUESTIONS.TEXT as QUESTION_TEXT , QUESTIONS.USER_ID as QUESTION_USER_ID, USERS.USER_NAME as QUESTION_USER_NAME, QUESTIONS.KEYWORDS as QUESTION_KEYWORD
                FROM   
                  QUESTIONS   
                INNER JOIN 
                  USERS ON QUESTIONS.USER_ID = USERS.ID
        }
        #build our where clause dynamically
        #questions :: subject, title, user, keyword
        sWhere = %{WHERE QUESTIONS.ACTIVE='t'}
        sWhere = sWhere + " AND INSTR(USERS.USER_NAME, :question_user_name) > 0" if query_criteria.has_key?(:question_user_name)     # , "%#{QUESTION_USER_NAME}%"
        sWhere = sWhere + " AND INSTR(QUESTIONS.TITLE, :question_title) > 0" if query_criteria.has_key?(:question_title) #, "%#{QUESTION_TITLE}%"
        sWhere = sWhere + " AND INSTR(QUESTIONS.TEXT, :question_subject) > 0" if query_criteria.has_key?(:question_subject)   #, "%#{QUESTION_SUBJECT}%"
        sWhere = sWhere + " AND INSTR(QUESTIONS.KEYWORDS, :question_keyword) > 0" if query_criteria.has_key?(:question_keyword)    #, "%#{QUESITON_KEYWORD}%"    
       
        #return our results
    #this workeD!!!!
    #http://stackoverflow.com/questions/28367495/avoid-sql-injection-with-connection-execute
      query = sanitize_sql([sSQL + sWhere, query_criteria])
      results = ActiveRecord::Base.connection.execute(query)
      return results
    end
end
