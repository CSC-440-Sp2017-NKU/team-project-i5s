class Search < ApplicationRecord
    def self.search_questions
#make sure we passing in values to the model
      query_criteria = {}
      
      if !query_criteria.empty? and (query_criteria.has_key?(:question_user_name) or query_criteria.has_key?(:question_title) or query_criteria.has_key?(:question_subject) or query_criteria.has_key?(:question_keyword))
       return question_results(query_criteria).to_h
      else
        return [].to_h
      end
    end
    
    
    
private
    def self.question_results(query_criteria)
    #query the DB for all questions/keywords/users
    #and whittle down the results based on teh passed-in parameters
        sSQL = %{SELECT   
                  Q.ID as QUESTION_ID, Q.TITLE as QUESTION_TITLE, Q.TEXT as QUESTION_TEXT, Q.USER_ID as QUESTION_USER_ID, U.USER_NAME as QUESTION_USER_NAME, K.KEYWORD AS QUESTION_KEYWORD 
                FROM   
                  QUESTIONS Q   
                INNER JOIN 
                  USERS U ON Q.USER_ID=U.ID    
                LEFT JOIN  
                  (SELECT 
                    QW.QUESTION_ID, QWK.KEYWORD 
                   FROM 
                   QUESTION_KEYWORDS QW INNER JOIN KEYWORDS QWK ON QW.KEYWORD_ID = QWK.ID 
                   )   K ON Q.ID = K.QUESTION_ID
                } 
                
        #build our where clause dynamically
        #questions :: subject, title, user, keyword
        sWhere = %{WHERE Q.ACTIVE='t'}
        sWhere = sWhere + " AND INSTR(U.USER_NAME, :question_user_name) > 0" if query_criteria.has_key?(:question_user_name)     # , "%#{QUESTION_USER_NAME}%"
        sWhere = sWhere + " AND INSTR(Q.TITLE, :question_title) > 0" if query_criteria.has_key?(:question_title) #, "%#{QUESTION_TITLE}%"
        sWhere = sWhere + " AND INSTR(Q.TEXT, :question_subject) > 0" if query_criteria.has_key?(:question_subject)   #, "%#{QUESTION_SUBJECT}%"
        sWhere = sWhere + " AND INSTR(K.KEYWORD, :question_keyword) > 0" if query_criteria.has_key?(:question_keyword)    #, "%#{QUESITON_KEYWORD}%"    
       
        #return our results
        return Search.find_by_sql [sSQL + sWhere, query_criteria]
    end
end
