class UrlShortenerGenerator
  UNIQUE_URL_LENGTH = 6

  def self.generate_unique_short_url(unique_short_url: nil)
    if unique_short_url.nil?
      unique_short_url = ([*('a'..'z'), *('0'..'9'), *('A'..'Z')]).sample(UNIQUE_URL_LENGTH).join
    end

    unless !UrlShortener.find_by_short_url(unique_short_url).nil?
      return unique_short_url
    else
      generate_unique_short_url # recursive method
    end
  end
end
