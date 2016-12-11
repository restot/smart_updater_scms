require 'test_helper'

class ReaderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reader_index_url
    assert_response :success
  end

  test "should get read" do
    get reader_read_url
    assert_response :success
  end

end
