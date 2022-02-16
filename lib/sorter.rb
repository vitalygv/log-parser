# frozen_string_literal: true

class Sorter
  def initialize(parsed_file)
    @parsed_file = parsed_file
  end

  def sort_views
    parsed_file.sort_by { |_url, parsed_url_views| -parsed_url_views.views }
  end

  def sort_unique_views
    parsed_file.sort_by { |_url, parsed_url_views| -parsed_url_views.unique_views }
  end

  private

  attr_reader :parsed_file
end
