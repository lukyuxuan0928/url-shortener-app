require 'test_helper'


class UrlShortenersTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @url = url_shorteners(:google)
  end

  test "generate a success shortener url" do
    url = 'https://www.lazada.com'
    post add_path, params: { url_shortener: { ori_url: url }, ori_url: url }
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_empty json_response['errors']
    assert_equal url, json_response['link']['ori_url']
    assert_not_empty json_response['link']['short_url']
  end

  test "should return an error with existing ori_url" do
    post add_path, params: { url_shortener: { ori_url: @url.ori_url }, ori_url: @url.ori_url }
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal ["has already been taken"], json_response['errors']['ori_url']
    assert_equal @url.ori_url, json_response['link']['ori_url']
    assert_not_empty json_response['link']['short_url']
  end

  test "should return an error with invalid ori_url" do
    post add_path, params: { url_shortener: { ori_url: 'asdasd' }, ori_url: 'asdasd' }
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal ["is not a valid URL"], json_response['errors']['ori_url']
    assert_empty json_response['link']
  end

  test "should return an error with empty ori_url" do
    post add_path, params: { url_shortener: { ori_url: '' }, ori_url: '' }
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal "can't be blank", json_response['errors']['ori_url'][0]
    assert_empty json_response['link']
  end

  test "should return an error with invalid short_url" do
    get '/fws'
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal ["URL invalid"], json_response['errors']
  end

  test "should return an error with non existing short_url" do
    get '/fwsa1F'
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal ["URL not found"], json_response['errors']
  end

  test "should redirect to ori_url with existing short_url" do
    get '/aki10a'
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "should return success with ajax" do
    post add_path, params: { url_shortener: { ori_url: '' }, ori_url: '' }, xhr: true
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal "can't be blank", json_response['errors']['ori_url'][0]
    assert_equal "application/json", @response.content_type
  end
end
