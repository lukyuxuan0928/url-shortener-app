require "application_system_test_case"


class UrlShortenersSystemTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit url_shorteners_url
  #
  #   assert_selector "h1", text: "UrlShortener"
  # end

  test "visit root" do
    visit root_path

    assert_selector "h1", text: "URL Shortener Application"
  end

  test "visit invalid short_url" do
     visit '/asd'

     assert_selector ".alert-danger", text: 'URL invalid.'
  end

  test "visit non existing short_url" do
     visit '/asdA1B'

     assert_selector ".alert-danger", text: 'URL not found.'
  end


  test "visit a valid short_url" do
     visit '/aki10a'

  end

  test "fill the from with existing url" do
    visit root_path

    fill_in "ori_url", with: "https://www.google.com"

    click_on "submit_btn"

  end

  test "fill the from with invalid url" do
    visit root_path

    fill_in "ori_url", with: "htt://www.google.com"

    click_on "submit_btn"

    assert_selector "#message_body", text: "Please enter a valid URL."
  end

  test "fill the from with valid and non existing url" do
    visit root_path

    fill_in "ori_url", with: "https://www.google.com"

    click_on "submit_btn"

  end
end
