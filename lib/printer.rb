# frozen_string_literal: true

class Printer
  def initialize(sorted_views)
    @sorted_views = sorted_views
  end

  def print_views
    puts '-= Total views =-'
    sorted_views.each { |line| puts "  #{line.first} #{line.last.views} views" }
    separation_line
  end

  def print_unique_views
    puts '-= Total unique views =-'
    sorted_views.each { |line| puts "  #{line.first} #{line.last.unique_views} views" }
    separation_line
  end

  private

  attr_reader :sorted_views

  def separation_line
    puts '_' * 17
  end
end
