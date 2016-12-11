require 'test_helper'

class LoaderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get loader_index_url
    assert_response :success
  end

end
