require 'test_helper'

class CuisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cui = cuis(:one)
  end

  test "should get index" do
    get cuis_url
    assert_response :success
  end

  test "should get new" do
    get new_cui_url
    assert_response :success
  end

  test "should create cui" do
    assert_difference('Cui.count') do
      post cuis_url, params: { cui: { contest_id: @cui.contest_id, point: @cui.point, user_id: @cui.user_id } }
    end

    assert_redirected_to cui_url(Cui.last)
  end

  test "should show cui" do
    get cui_url(@cui)
    assert_response :success
  end

  test "should get edit" do
    get edit_cui_url(@cui)
    assert_response :success
  end

  test "should update cui" do
    patch cui_url(@cui), params: { cui: { contest_id: @cui.contest_id, point: @cui.point, user_id: @cui.user_id } }
    assert_redirected_to cui_url(@cui)
  end

  test "should destroy cui" do
    assert_difference('Cui.count', -1) do
      delete cui_url(@cui)
    end

    assert_redirected_to cuis_url
  end
end
