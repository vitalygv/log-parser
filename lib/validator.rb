# frozen_string_literal: true

class Validator
  def initialize(file_path)
    @file_path = file_path
  end

  def call
    validate_file_path
    validate_file_existence
    validate_file_emptiness
    validate_file_format
  end

  private

  def validate_file_path
    return unless file_path.nil?

    raise IOError, 'No file provided'
  end

  def validate_file_existence
    return if File.exist?(file_path) && File.file?(file_path)

    raise IOError, 'Not a valid file'
  end

  def validate_file_emptiness
    return unless File.zero?(file_path)

    raise IOError, 'File is empty'
  end

  def validate_file_format
    return if File.extname(file_path) == '.log'

    raise IOError, 'File is not a log'
  end

  attr_reader :file_path
end
