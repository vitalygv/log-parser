# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/printer'

describe Printer do
  subject { described_class.new(sorted_views) }

  let(:sorted_views) do
    [
      [url_one, counter_one], [url_two, counter_two]
    ]
  end

  let(:url_one) { '/help_page/1' }
  let(:url_two) { '/home' }

  let(:counter_one) { instance_double(Counter, views: 90, unique_views: 23) }
  let(:counter_two) { instance_double(Counter, views: 89, unique_views: 20) }

  describe '#print_views' do
    let(:expected_output) do
      <<~STRING
        -= Total views =-
          /help_page/1 90 views
          /home 89 views
        _________________
      STRING
    end

    it 'prints views' do
      expect { subject.print_views }.to output(expected_output).to_stdout
    end
  end

  describe '#print_unique_views' do
    let(:expected_output) do
      <<~STRING
        -= Total unique views =-
          /help_page/1 23 views
          /home 20 views
        _________________
      STRING
    end

    it 'prints unique views' do
      expect { subject.print_unique_views }.to output(expected_output).to_stdout
    end
  end
end
