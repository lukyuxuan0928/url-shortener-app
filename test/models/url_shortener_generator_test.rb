require 'test_helper'

class UrlShortenerGeneratorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @url = UrlShortener.new(ori_url: "https://www.google.com", short_url: "aj1Az0")
  end

  test "should return a short_url" do
    short_url = UrlShortenerGenerator.generate_unique_short_url
    assert_not_empty short_url
  end

  test "should match short_url with length" do
    1000.times do
      short_url = UrlShortenerGenerator.generate_unique_short_url
      assert_equal UrlShortenerGenerator::UNIQUE_URL_LENGTH, short_url.length
    end
  end

  test "should match short_url with regex" do
    1000.times do
      short_url = UrlShortenerGenerator.generate_unique_short_url
      assert_match /^[a-zA-Z0-9]{6}$/, short_url
    end
  end
end
