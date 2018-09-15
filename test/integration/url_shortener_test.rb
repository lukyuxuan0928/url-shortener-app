require 'test_helper'

class UrlShortenerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @url = url_shorteners(:google)
  end

  test "generate a shortener url" do
    post add_path, params: { url_shortener: { ori_url: @url.ori_url } }
    assert_response :success
    json_response = JSON.parse(response.body)
  end
end
