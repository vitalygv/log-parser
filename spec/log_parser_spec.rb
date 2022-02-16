# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/log_parser'
require_relative '../lib/counter'
require_relative '../lib/parser'
require_relative '../lib/printer'
require_relative '../lib/sorter'
require_relative '../lib/validator'

describe LogParser do
  subject { described_class.new(log_file) }

  let(:log_file) { 'webserver.log' }
  describe '#call' do
    context 'when file is valid' do
      let(:expected_output) do
        <<~STRING
          -= Total views =-
            /about/2 90 views
            /contact 89 views
            /index 82 views
            /about 81 views
            /help_page/1 80 views
            /home 78 views
          _________________
          -= Total unique views =-
            /help_page/1 23 views
            /contact 23 views
            /home 23 views
            /index 23 views
            /about/2 22 views
            /about 21 views
          _________________
        STRING
      end

      it 'prints correct result' do
        expect { subject.call }.to output(expected_output).to_stdout
      end
    end

    context 'when no argument provided' do
      let(:log_file) { nil }

      it 'prints error message' do
        expect { subject.call }.to output("No file provided\n").to_stderr
      end
    end

    context 'when argument is not a file' do
      let(:log_file) { 'not_a_file' }

      it 'prints error message' do
        expect { subject.call }.to output("Not a valid file\n").to_stderr
      end
    end

    context 'when file is empty' do
      let(:log_file) { 'spec/fixtures/empty_file.log' }

      it 'prints error message' do
        expect { subject.call }.to output("File is empty\n").to_stderr
      end
    end

    context 'when file is not a log' do
      let(:log_file) { 'spec/fixtures/not_a_log' }

      it 'prints error message' do
        expect { subject.call }.to output("File is not a log\n").to_stderr
      end
    end
  end
end
