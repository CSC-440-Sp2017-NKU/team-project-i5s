require 'test_helper'

class ForumControllerTest < ActionDispatch::IntegrationTest
  
  #def setup
    #@base_title = "Ruby on Rails Tutorial Sample App"
 # end
  
  test "should get root" do
    get root_url
    assert_response :success
  end
  
  #test "should get home" do
   # get forum_home_url
    #assert_response :success
    #assert_select "title", "#{@base_title}"
  #end

  test "should get view forum" do
    get forum_view_forum_url
    assert_response :success
    #assert_select "title", "view forum | #{@base_title}"
  end

  test "should get index" do
    get forum_index_url
    assert_response :success
    #assert_select "title", "index | #{@base_title}"
  end
  
end
