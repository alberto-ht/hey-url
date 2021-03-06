# frozen_string_literal: true

class Click < ApplicationRecord
  belongs_to :url

  def self.create_click(url, bro, plat)
    click = Click.create(url: url, browser: bro, platform: plat)
    url.clicks_count = url.clicks_count + 1 # al final del test
    url.save                                # al final
    click
  end 
end
