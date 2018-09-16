require 'test_helper'

class UrlShortenerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @url = UrlShortener.new(ori_url: "https://www.google.com", short_url: "localhost:3000/aj1Az0")
  end

  test "should not save without ori_url" do
    @url.ori_url = ""
    assert_not @url.save
  end

  test "should not save without short_url" do
    @url.short_url = ""
    assert_not @url.save
  end

  test "ori_url should be unique" do
    @url.save
    @url = UrlShortener.new(ori_url: "https://www.google.com", short_url: "localhost:3000/aDsgz0")
    assert_not @url.save
  end

  test "short_url should be unique" do
    @url.save
    @url = UrlShortener.new(ori_url: "https://www.google.com", short_url: "localhost:3000/aj1Az0")
    assert_not @url.save
  end

  test "short_url length should be 21" do
    assert_equal 21, @url.short_url.length
  end

end
