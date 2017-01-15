require 'test_helper'

class ExportControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get export_index_url
    assert_response :success
  end

end
