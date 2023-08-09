require "test_helper"

class KppostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kppost = kpposts(:one)
  end

  test "should get index" do
    get kpposts_url
    assert_response :success
  end

  test "should get new" do
    get new_kppost_url
    assert_response :success
  end

  test "should create kppost" do
    assert_difference("Kppost.count") do
      post kpposts_url, params: { kppost: { description: @kppost.description, kpuser_id: @kppost.kpuser_id } }
    end

    assert_redirected_to kppost_url(Kppost.last)
  end

  test "should show kppost" do
    get kppost_url(@kppost)
    assert_response :success
  end

  test "should get edit" do
    get edit_kppost_url(@kppost)
    assert_response :success
  end

  test "should update kppost" do
    patch kppost_url(@kppost), params: { kppost: { description: @kppost.description, kpuser_id: @kppost.kpuser_id } }
    assert_redirected_to kppost_url(@kppost)
  end

  test "should destroy kppost" do
    assert_difference("Kppost.count", -1) do
      delete kppost_url(@kppost)
    end

    assert_redirected_to kpposts_url
  end
end
