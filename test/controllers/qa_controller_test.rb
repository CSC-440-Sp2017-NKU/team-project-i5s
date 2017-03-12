require 'test_helper'

class QAControllerTest < ActionDispatch::IntegrationTest
    
     #def setup
    #@base_title = "Ruby on Rails Tutorial Sample App"
 # end
 
  test "should get answer question" do
    get qa_answer_question_url
    assert_response :success
    #assert_select "title", "ask question | #{@base_title}"
  end

  test "should get post question" do
    get qa_post_question_url
    assert_response :success
    #assert_select "title", "post question | #{@base_title}"
  end
  
  test "should get view question" do
      get qa_view_question_url
      assert_response :success
      #assert_select "title", "view question | #{@base_title}"
    end 
end