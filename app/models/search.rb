class Search < ApplicationRecord
    def self.search_questions
#make sure we passing in values to the model
      query_criteria = {:question_user_name => "Harry"}
      
      if !query_criteria.empty? and (query_criteria.has_key?(:question_user_name) or query_criteria.has_key?(:question_title) or query_criteria.has_key?(:question_subject) or query_criteria.has_key?(:question_keyword))
        return question_results(query_criteria) #.to_h
      else
        #return [] #.to_h
      end
    end
    
    
    
private
    def self.question_results(query_criteria)
    #query the DB for all questions/keywords/users
    #and whittle down the results based on teh passed-in parameters
        # sSQL = %{SELECT   
        #           Q.ID as QUESTION_ID, Q.TITLE as QUESTION_TITLE, Q.TEXT as QUESTION_TEXT, Q.USER_ID as QUESTION_USER_ID, U.USER_NAME as QUESTION_USER_NAME, K.KEYWORD AS QUESTION_KEYWORD 
        #         FROM   
        #           QUESTIONS Q   
        #         INNER JOIN 
        #           USERS U ON Q.USER_ID=U.ID    
        #         LEFT JOIN  
        #           (SELECT 
        #             QW.QUESTION_ID, QWK.KEYWORD 
        #           FROM 
        #           QUESTION_KEYWORDS QW INNER JOIN KEYWORDS QWK ON QW.KEYWORD_ID = QWK.ID 
        #           )   K ON Q.ID = K.QUESTION_ID
        #         } 
        # sSQL = %{SELECT   
        #           Q.ID, Q.TITLE, Q.TEXT, Q.USER_ID, U.USER_NAME, K.KEYWORD 
        #         FROM   
        #           QUESTIONS Q   
        #         INNER JOIN 
        #           USERS U ON Q.USER_ID = U.ID    
        #         LEFT JOIN  
        #           (SELECT 
        #             QW.QUESTION_ID, QWK.KEYWORD 
        #           FROM 
        #           QUESTION_KEYWORDS QW INNER JOIN KEYWORDS QWK ON QW.KEYWORD_ID = QWK.ID 
        #           )   K ON Q.ID = K.QUESTION_ID
        #         } 
        
        sSQL = %{SELECT   
                  QUESTIONS.ID, QUESTIONS.Title 
                FROM   
                  QUESTIONS   
                INNER JOIN 
                  USERS ON QUESTIONS.USER_ID = U.ID    
                LEFT JOIN  
                  (SELECT 
                    QW.QUESTION_ID, QWK.KEYWORD 
                  FROM 
                  QUESTION_KEYWORDS QW INNER JOIN KEYWORDS QWK ON QW.KEYWORD_ID = QWK.ID 
                  )   K ON QUESTIONS.ID = K.QUESTION_ID
                } 
        
        sSQL2 = %{INNER JOIN 
                  USERS ON QUESTIONS.USER_ID = USERS.ID    
                LEFT JOIN  
                  (SELECT 
                    QW.QUESTION_ID, QWK.KEYWORD 
                  FROM 
                  QUESTION_KEYWORDS QW INNER JOIN KEYWORDS QWK ON QW.KEYWORD_ID = QWK.ID 
                  )   K ON QUESTIONS.ID = K.QUESTION_ID}
        sSELECT = %{QUESTIONS.ID, QUESTIONS.TITLE, QUESTIONS.TEXT, QUESTIONS.USER_ID, USERS.USER_NAME, K.KEYWORD}    
        
        sSQL3 = %{SELECT DISTINCT  
                  QUESTIONS.ID as QUESTION_ID, QUESTIONS.TITLE as QUESTION_TITLE, QUESTIONS.TEXT as QUESTION_TEXT , QUESTIONS.USER_ID as QUESTION_USER_ID, USERS.USER_NAME as QUESTION_USER_NAME, K.KEYWORD as QUESTION_KEYWORD
                FROM   
                  QUESTIONS   
                INNER JOIN 
                  USERS ON QUESTIONS.USER_ID = USERS.ID    
                LEFT JOIN  
                  (SELECT 
                    QW.QUESTION_ID, QWK.KEYWORD 
                  FROM 
                  QUESTION_KEYWORDS QW INNER JOIN KEYWORDS QWK ON QW.KEYWORD_ID = QWK.ID 
                  )   K ON QUESTIONS.ID = K.QUESTION_ID
        }
        #build our where clause dynamically
        #questions :: subject, title, user, keyword
        sWhere = %{WHERE QUESTIONS.ACTIVE='t'}
        sWhere = sWhere + " AND INSTR(USERS.USER_NAME, :question_user_name) > 0" if query_criteria.has_key?(:question_user_name)     # , "%#{QUESTION_USER_NAME}%"
        sWhere = sWhere + " AND INSTR(QUESTIONS.TITLE, :question_title) > 0" if query_criteria.has_key?(:question_title) #, "%#{QUESTION_TITLE}%"
        sWhere = sWhere + " AND INSTR(QUESTIONS.TEXT, :question_subject) > 0" if query_criteria.has_key?(:question_subject)   #, "%#{QUESTION_SUBJECT}%"
        sWhere = sWhere + " AND INSTR(K.KEYWORD, :question_keyword) > 0" if query_criteria.has_key?(:question_keyword)    #, "%#{QUESITON_KEYWORD}%"    
       
        #return our results
        #http://guides.rubyonrails.org/v3.2/active_record_querying.html 11.1 Using a String SQL Fragment
       # x =  Search.find_by_sql([sSQL + sWhere, query_criteria])
        #x = Question.joins(sSQL2).select(sSELECT).where(sWhere, query_criteria)
        #x = Question.where(user_id:7, active: true) + User.where("instr(user_name, ?) > 0", "Harry") #+ Starter.search(search_term)
       # return  ActiveRecord::Base.connection.find_by_sql [sSQL3 + sWhere, query_criteria]
        #return  ActiveRecord::Base.connection.find_by_sql(sSQL3).where(sWhere, query_criteria) #]
        #Search.execute(sSQL3 + sWhere, query_criteria)
     # return ActiveRecord::Base.connection.exec_query(sSQL3) #.where(sWhere, query_criteria) #works
     # return ActiveRecord::Base.connection.exec_query(sSQL3 + sWhere, query_criteria)
      
      #http://stackoverflow.com/questions/4483049/how-to-execute-a-raw-update-sql-with-dynamic-binding-in-rails/4484549#4484549
      #st = ActiveRecord::Base.connection.raw_connection.prepare(sSQL3 + sWhere)
      #st.execute(query_criteria)
     # st.close
    #return st
    
    #this workeD!!!!
    #http://stackoverflow.com/questions/28367495/avoid-sql-injection-with-connection-execute
      query = sanitize_sql([sSQL3 + sWhere, query_criteria])
      return ActiveRecord::Base.connection.execute(query)
    end
end
