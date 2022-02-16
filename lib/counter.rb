# frozen_string_literal: true

class Counter
  def initialize(unique_ips: [], views: 0)
    @unique_ips = unique_ips
    @views = views
  end

  attr_reader :views

  def add_ip(ip)
    @views += 1
    unique_ips << ip unless unique_ips.include?(ip)
  end

  def unique_views
    unique_ips.size
  end

  private

  attr_reader :unique_ips
end
