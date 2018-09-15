class UrlShortener < ApplicationRecord
  validates :ori_url,  presence: true, url: true ,uniqueness: true
  validates :short_url, presence: true, uniqueness: true, length: { is: 21 }
end
