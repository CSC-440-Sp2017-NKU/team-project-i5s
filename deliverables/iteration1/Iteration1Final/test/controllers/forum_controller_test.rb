require 'test_helper'

class ForumControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
    def index
    end
    
    def view_forum
    end
    
    def list_forums
    end
    
    test "should get index" do
      get forum_index_url
      assert_response :success
      #assert_select "title", "view index| #{@base_title}"
    end 
    
    test "should get view forum" do
      get forum_view_forum_url
      assert_response :success
      #assert_select "title", "view view forum | #{@base_title}"
    end 
    
    test "should get list forums" do
      get forum_list_forums_url
      assert_response :success
      #assert_select "title", "view list forums | #{@base_title}"
    end 
end
