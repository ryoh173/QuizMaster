require 'test_helper'

class QuizModeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quiz_mode_index_url
    assert_response :success
  end

end
