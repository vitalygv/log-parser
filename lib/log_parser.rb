# frozen_string_literal: true

require_relative 'validator'
require_relative 'parser'
require_relative 'sorter'
require_relative 'printer'

class LogParser
  def initialize(log_file)
    @log_file = log_file
    @parsed_file = {}
  end

  def call
    validate_file
    parse_file
    print_views
    print_unique_views
  rescue IOError => e
    warn e.message
  end

  private

  attr_reader :log_file, :parsed_file

  def validate_file
    Validator.new(log_file).call
  end

  def parse_file
    @parsed_file = Parser.new(log_file).call
  end

  def print_views
    sorted_views = Sorter.new(parsed_file).sort_views
    Printer.new(sorted_views).print_views
  end

  def print_unique_views
    sorted_views = Sorter.new(parsed_file).sort_unique_views
    Printer.new(sorted_views).print_unique_views
  end
end
