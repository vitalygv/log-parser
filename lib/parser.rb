# frozen_string_literal: true

require_relative 'counter'

class Parser
  def initialize(log_file)
    @log_file = log_file
    @result_hash = {}
  end

  def call
    File.foreach(log_file) do |line|
      url, ip = line.split
      result_hash[url] = Counter.new if result_hash[url].nil?
      result_hash[url].add_ip(ip)
    end

    result_hash
  end

  private

  attr_reader :log_file, :result_hash
end
