require "application_system_test_case"

class UrlShortenersTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit url_shorteners_url
  #
  #   assert_selector "h1", text: "UrlShortener"
  # end

  test "visit root" do
    visit root_path

    assert_selector "h1", text: "URL Shortener Application"
  end

  # test "visit invalid short_url" do
  #   visit '/asd'
  #
  #   assert_response :success
  # end

  # test "fill the from" do
  #   visit root_path
  #
  #   fill_in "ori_url", with: "https://www.google.com"
  #
  #   click_on "submit_btn"
  #
  #   assert_select "alert(This url alredy stored in our database\n\nShort_URL: localhost:3000/aki10a)"
  # end
end
