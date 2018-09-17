class UrlShortenersController < ApplicationController
  protect_from_forgery except: :redirect

  def index

  end

  def add
    # initial the variable
    errors = []
    valid_url = []

    # create a new url
    url = UrlShortener.new(ori_url: params[:ori_url], short_url: UrlShortenerGenerator.generate_unique_short_url)

    if url.valid? # if url valid then save, else show error
      url.save
      valid_url = url
      valid_url.short_url = request.host_with_port + '/' + valid_url.short_url
    else # get errors
      errors = url.errors

      if url.errors.messages[:ori_url] == ['has already been taken'] # if ori_url duplicate then return short_url
        valid_url = UrlShortener.find_by_ori_url(url.ori_url) # return a exist url
        valid_url.short_url = request.host_with_port + '/' + valid_url.short_url
      end
    end

    render json: { link: valid_url, errors: errors }, status: 200 # render the json format
  end

  def redirect
    if params[:short_url].length == UrlShortenerGenerator::UNIQUE_URL_LENGTH # check short_url length
      url = UrlShortener.find_by_short_url(params[:short_url]) # find from database

      if !url.nil? # if exist then redirect to ori_url, else show error
        redirect_to url.ori_url
      else
        flash.now[:danger] = 'URL not found.'
        render 'redirect'
      end
    else
      flash.now[:danger] = 'URL invalid.'
      render 'redirect'
    end
  end

end
