require 'test_helper'

class StatsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get stats_new_url
    assert_response :success
  end

end
