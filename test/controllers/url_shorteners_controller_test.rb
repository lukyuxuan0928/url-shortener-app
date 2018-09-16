require 'test_helper'


class UrlShortenersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get add" do
    post add_path
    assert_response :success
  end

  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should get short_url" do
    get '/123'
    assert_response :success
  end
end
