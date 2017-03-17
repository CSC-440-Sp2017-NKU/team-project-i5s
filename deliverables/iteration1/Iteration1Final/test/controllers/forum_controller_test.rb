require 'test_helper'

class ForumControllerTest < ActionDispatch::IntegrationTest
  
   # def setup
      #load "#{Rails.root}/db/seeds.rb"
   # end
    test "should get index" do
      get forum_index_url
      #get forum_index_url
      assert_response :success
    end 
    
  #  test "should get view forum" do
     # get forum_view_forum_url #, params: {id: 1}
     # assert_response :success
  #  end 
    
  #  test "should get forum count" do
  #    i = Int(Forum.count)
  #    assert i > 0
  #  end
end
