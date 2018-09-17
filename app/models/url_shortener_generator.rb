class UrlShortenerGenerator
  UNIQUE_URL_LENGTH = 6

  def self.generate_unique_short_url
    url = ([*('a'..'z'), *('0'..'9'), *('A'..'Z')]).sample(UNIQUE_URL_LENGTH).join

    unless !UrlShortener.find_by_short_url(url).nil?
      return url
    else
      generate_unique_short_url # recursive method
    end
  end
end
