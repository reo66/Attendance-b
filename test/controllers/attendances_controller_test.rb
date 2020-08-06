require 'test_helper'

class AttendancesControllerTest < ActionDispatch::IntegrationTest
  test "should get def" do
    get attendances_def_url
    assert_response :success
  end

  test "should get edit_one_month" do
    get attendances_edit_one_month_url
    assert_response :success
  end

end
