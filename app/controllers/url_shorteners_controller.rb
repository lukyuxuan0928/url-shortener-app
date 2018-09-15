class UrlShortenersController < ApplicationController
  def add
    errors = []
    valid_url = []
    url = UrlShortener.new(ori_url: params[:ori_url], short_url: generate_unique_short_url)

    if url.valid?
      valid_url = url
    else
      errors = url.errors

      case url.errors.messages[:ori_url] # a_variable is the variable we want to compare
      when ['is not a valid URL']    #compare to 1

      when ['has already been taken']    #compare to 2
        valid_url = UrlShortener.find_by_ori_url(url.ori_url)
      else

      end

    end

    render json: { link: valid_url, errors: errors }, status: 200
  end

  def redirect
    if params[:short_url].length == 6
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
      url = 'localhost:3000/' + ([*('a'..'z'), *('0'..'9'), *('A'..'Z')]).sample(6).join

      unless !UrlShortener.find_by_short_url(url).nil?
        return url
      else
        generate_unique_url
      end
    end
end
