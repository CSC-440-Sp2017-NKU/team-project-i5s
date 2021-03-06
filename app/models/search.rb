class Search < ApplicationRecord
  
    def self.search_courses(query_criteria)
      #make sure we passing in values to the model
      #course :: name, instructor
     # query_criteria[:limit] = 50
      if (query_criteria.has_key?(:course_instructor_name) or query_criteria.has_key?(:course_name)) and has_payload?(query_criteria)
        return course_results(query_criteria)
      else
        return []
      end
    end
    
    def self.search_questions(query_criteria)
      #make sure we passing in values to the model
      #query_criteria[:limit] = 50
      if (query_criteria.has_key?(:question_user_name) or query_criteria.has_key?(:question_title) or query_criteria.has_key?(:question_text) or query_criteria.has_key?(:question_keyword)) and has_payload?(query_criteria)
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
      


        # sSQL = %{SELECT DISTINCT  
        #           COURSES.ID as COURSE_ID, COURSES.COURSE_NAME, SECTIONS.ID as SECTION_ID, SECTIONS.USER_ID as COURSE_INSTRUCTOR_ID, USERS.USER_NAME as COURSE_INSTRUCTOR_NAME
        #         FROM
        #           COURSES
        #           LEFT JOIN 
        #           (SECTIONS 
        #             INNER JOIN
        #             USERS ON SECTIONS.USER_ID = USERS.ID 
        #           ) K ON COURSES.ID = K.COURSE_ID
        #         }
                
        #build our where clause dynamically
        #course :: name, instructor
        # if !query_criteria[:course_instructor_name].empty? and !query_criteria[:course_name].empty?
        #   sWhere = "WHERE INSTR(USERS.USER_NAME, :course_instructor_name) > 0 AND INSTR(COURSES.COURSE_NAME, :course_name) > 0"
           
        # else
        #     sWhere = "WHERE "
        #     sWhere = sWhere + " INSTR(USERS.USER_NAME, :course_instructor_name) > 0" if !query_criteria[:course_instructor_name].empty?
        #     sWhere = sWhere + " INSTR(COURSES.COURSE_NAME, :course_name) > 0" if !query_criteria[:course_name].empty? 
        # end
        
      case Rails.env
      when "development" # DEVELOPMENT :: SQL LITE
      sSQL = %{SELECT DISTINCT  
                   COURSES.ID as COURSE_ID, COURSES.COURSE_NAME, SECTIONS.ID as SECTION_ID, SECTIONS.USER_ID as COURSE_INSTRUCTOR_ID, USERS.USER_NAME as COURSE_INSTRUCTOR_NAME
                 FROM
                   COURSES
                   LEFT JOIN 
                   (SECTIONS 
                    INNER JOIN
                    USERS ON SECTIONS.USER_ID = USERS.ID 
                   ) K ON COURSES.ID = K.COURSE_ID
                }
      
      
          #ActiveRecord::Base.connection.execute('CREATE UNIQUE INDEX uq_idx_one_vote_per_answer_user ON VOTES (answers_id, user_id);') 
      	  if !query_criteria[:course_instructor_name].empty? and !query_criteria[:course_name].empty?
            sWhere = "WHERE INSTR(USERS.USER_NAME, :course_instructor_name) > 0 AND INSTR(COURSES.COURSE_NAME, :course_name) > 0"
             
          else
        	  sWhere = "WHERE "
            sWhere = sWhere + " INSTR(USERS.USER_NAME, :course_instructor_name) > 0" if !query_criteria[:course_instructor_name].empty?
            sWhere = sWhere + " INSTR(COURSES.COURSE_NAME, :course_name) > 0" if !query_criteria[:course_name].empty? 
          end
          
      when "production" # PRODUCTION :: PostGRE
       #thanks postGRE...
       
       sSQL = %{SELECT DISTINCT  
                   COURSES.ID as COURSE_ID, COURSES.COURSE_NAME, K.ID as SECTION_ID, K.USER_ID as COURSE_INSTRUCTOR_ID, K.USER_NAME as COURSE_INSTRUCTOR_NAME
                 FROM
                   COURSES
                   LEFT JOIN 
                   (SELECT 
                    SECTIONS.COURSE_ID, SECTIONS.ID, SECTIONS.USER_ID, USERS.USER_NAME
                   FROM
                    SECTIONS 
                    INNER JOIN
                    USERS ON SECTIONS.USER_ID = USERS.ID 
                   ) K ON COURSES.ID = K.COURSE_ID
                }
          if !query_criteria[:course_instructor_name].empty? and !query_criteria[:course_name].empty?
            sWhere = "WHERE position(:course_instructor_name in K.USER_NAME) > 0 AND position(:course_name in K.COURSE_NAME) > 0"
             
          else
            sWhere = "WHERE "
            sWhere = sWhere + " position(:course_instructor_name in  K.USER_NAME ) > 0" if !query_criteria[:course_instructor_name].empty?
            sWhere = sWhere + " position(:course_name in COURSES.COURSE_NAME) > 0" if !query_criteria[:course_name].empty? 
          end
      end
        
        
      sWhere = sWhere + " LIMIT 50"
        
        #return our results
        #this workeD!!!!
        #http://stackoverflow.com/questions/28367495/avoid-sql-injection-with-connection-execute
      query = sanitize_sql([sSQL + sWhere, query_criteria])
      results = ActiveRecord::Base.connection.execute(query)
    #  byebug
      return results
      
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
      case Rails.env
        when "development" # DEVELOPMENT :: SQL LITE
          #ActiveRecord::Base.connection.execute('CREATE UNIQUE INDEX uq_idx_one_vote_per_answer_user ON VOTES (answers_id, user_id);') 
      	  sWhere = %{WHERE QUESTIONS.ACTIVE='t'}
          sWhere = sWhere + " AND INSTR(USERS.USER_NAME, :question_user_name) > 0" if check_criteria(query_criteria,:question_user_name)
          sWhere = sWhere + " AND INSTR(QUESTIONS.TITLE, :question_title) > 0" if check_criteria(query_criteria,:question_title)
          sWhere = sWhere + " AND INSTR(QUESTIONS.TEXT, :question_text) > 0" if check_criteria(query_criteria,:question_text)
          sWhere = sWhere + " AND INSTR(QUESTIONS.KEYWORDS, :question_keyword) > 0" if check_criteria(query_criteria,:question_keyword)       
          sWhere = sWhere + " LIMIT 50"  
      	
        when "production" # PRODUCTION :: PostGRE
           #thanks postGRE...
       
          sWhere = %{WHERE QUESTIONS.ACTIVE='t'}
          sWhere = sWhere + " AND position(:question_user_name in USERS.USER_NAME) > 0" if check_criteria(query_criteria,:question_user_name)
          sWhere = sWhere + " AND position(:question_title in QUESTIONS.TITLE) > 0" if check_criteria(query_criteria,:question_title)
          sWhere = sWhere + " AND position(:question_text in QUESTIONS.TEXT) > 0" if check_criteria(query_criteria,:question_text)
          sWhere = sWhere + " AND position(:question_keyword in QUESTIONS.KEYWORDS) > 0" if check_criteria(query_criteria,:question_keyword)       
          sWhere = sWhere + " LIMIT 50"
      end
      
        # sWhere = %{WHERE QUESTIONS.ACTIVE='t'}
        # sWhere = sWhere + " AND INSTR(USERS.USER_NAME, :question_user_name) > 0" if check_criteria(query_criteria,:question_user_name)
        # sWhere = sWhere + " AND INSTR(QUESTIONS.TITLE, :question_title) > 0" if check_criteria(query_criteria,:question_title)
        # sWhere = sWhere + " AND INSTR(QUESTIONS.TEXT, :question_text) > 0" if check_criteria(query_criteria,:question_text)
        # sWhere = sWhere + " AND INSTR(QUESTIONS.KEYWORDS, :question_keyword) > 0" if check_criteria(query_criteria,:question_keyword)       
        # sWhere = sWhere + " LIMIT 50" 
        
        #return our results
    #this workeD!!!!
    #http://stackoverflow.com/questions/28367495/avoid-sql-injection-with-connection-execute
      query = sanitize_sql([sSQL + sWhere, query_criteria])
      results = ActiveRecord::Base.connection.execute(query)
      return results
    end
    
    def self.check_criteria(query_criteria,field)
      return !query_criteria[field].nil? && !query_criteria[field].empty?
    end
    
    
    #pass in an iterble object and returns whether or not there is data in the collection
    def self.has_payload?(data)
      bln = false
      data.each do |k,v|
        if !v.empty?
          bln = true
          break
        end
      end
      
      return bln
    end
end
