class UrlShortenersController < ApplicationController
  UNIQUE_URL_LENGTH = 6


  def index

  end

  def add
    # initial the variable
    errors = []
    valid_url = []

    # create a new url
    url = UrlShortener.new(ori_url: params[:ori_url], short_url: generate_unique_short_url)

    if url.valid? # url valid?
      url.save
      valid_url = url
    else # get errors
      errors = url.errors

      if url.errors.messages[:ori_url] == ['has already been taken']
        valid_url = UrlShortener.find_by_ori_url(url.ori_url) # return a exist url
      end
    end

    render json: { link: valid_url, errors: errors }, status: 200 # render the json format
  end

  def redirect
    if params[:short_url].length == UNIQUE_URL_LENGTH
      #url = UrlShortener.find_by_short_url(request.host_with_port + '/' + params[:short_url])
      url = UrlShortener.find_by_short_url('localhost:3000/' + params[:short_url])

      if !url.nil?
        redirect_to url.ori_url
      else
        render json: { errors: ['URL not found'] }, status: 200
      end
    else
      render json: { errors: ['URL invalid'] }, status: 200
    end
  end

  private
    def generate_unique_short_url
      # url = request.host_with_port + '/' + ([*('a'..'z'), *('0'..'9'), *('A'..'Z')]).sample(6).join
      url = 'localhost:3000/' + ([*('a'..'z'), *('0'..'9'), *('A'..'Z')]).sample(UNIQUE_URL_LENGTH).join

      unless !UrlShortener.find_by_short_url(url).nil?
        return url
      else
        generate_unique_url # recursive method
      end
    end
end
