# frozen_string_literal: true
class UrlsController < ApplicationController
  def index
    # recent 10 short urls
    @url = Url.new
    @urls = Url.latest
  end

  def create
    #raise 'add some code'
    # create a new URL record
    @url = Url.new(url_params)
    if @url.save
      flash[:notice] = 'The URL was created!'
      redirect_to root_path
    else
      @urls = Url.latest
      render :index
    end

  end

  def show
    @url = Url.new(short_url: 'ABCDE', original_url: 'http://google.com', created_at: Time.now)
    # implement queries
    @daily_clicks = [
      ['1', 13],
      ['2', 2],
      ['3', 1],
      ['4', 7],
      ['5', 20],
      ['6', 18],
      ['7', 10],
      ['8', 20],
      ['9', 15],
      ['10', 5]
    ]
    @browsers_clicks = [
      ['IE', 13],
      ['Firefox', 22],
      ['Chrome', 17],
      ['Safari', 7]
    ]
    @platform_clicks = [
      ['Windows', 13],
      ['macOS', 22],
      ['Ubuntu', 17],
      ['Other', 7]
    ]
  end

  def visit
    # params[:short_url]
    #render plain: 'redirecting to url...'
    @short_url = params[:short_url]
    @url = Url.find_by(short_url: @short_url)

    # check browser & platform
    bro = chkbrw(bro)
    plat = chkplat(plat)

    @click = Click.create(url: @url, browser: bro, platform: plat)   
    @url.clicks_count = @url.clicks_count + 1
    @url.save
    redirect_to "#{@url.original_url}"
  end

  private

  def url_params
    params.require(:url).permit(:original_url, :short_url)
  end

  def chkbrw(bro)
    if browser.firefox?
      bro ='firefox'
    else
      if browser.chrome?
        bro='chrome'
      else
        bro='other'
      end
    end
    return bro
  end

  def chkplat(plat)
      if browser.platform.windows?
      plat ='windows'
    else
      if browser.platform.linux?
        plat='linux'
      else
        plat='other'
      end
    end
  end

end
