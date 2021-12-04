# frozen_string_literal: true

class Url < ApplicationRecord
  has_many :clicks
  scope :latest, -> { limit(10).order('created_at DESC') }

  validates :original_url, url: true
  before_create :generate_short_url

  def generate_short_url
    chars = ('A'..'Z').to_a
    self.short_url = 5.times.map{ chars.sample }.join
  end
end
