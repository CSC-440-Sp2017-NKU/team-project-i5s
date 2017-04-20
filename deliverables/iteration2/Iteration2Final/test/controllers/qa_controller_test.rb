require 'test_helper'


class QAControllerTest < ActionDispatch::IntegrationTest
    
     #def setup
    #@base_title = "Ruby on Rails Tutorial Sample App"
 # end
 
  test "should get post new question form" do
    get qa_post_question_url, params:{forum_id:"1"}
    assert_response :success
  end
  
  test "test posting question" do
    forum_id=1
    params = {question:{title: "title testing tests", text: "testing test tests", forum_id: forum_id}}
    post "/Question/Post", params
    assert_response :success
  end 

#  test "should get post question" do
  #  p qa_post_question_url
 #   get qa_post_question_url
  #  assert_response :success
   # assert_select "title", "post question | #{@base_title}"
 # end
  
#  test "should get view question" do
    #p qa_view_question_url
 #     get qa_view_question_url
  #    assert_response :success
      #assert_select "title", "view question | #{@base_title}"
  #  end 
end
