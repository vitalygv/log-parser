# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/sorter'

describe Sorter do
  subject { described_class.new(parsed_file) }

  let(:parsed_file) do
    {
      url_one => counter_one,
      url_two => counter_two
    }
  end

  let(:url_one) { '/help_page/1' }
  let(:url_two) { '/home' }

  let(:counter_one) { instance_double(Counter, views: 90, unique_views: 23) }
  let(:counter_two) { instance_double(Counter, views: 89, unique_views: 20) }

  describe '#sort_views' do
    let(:expected_output) do
      [
        [url_one, counter_one], [url_two, counter_two]
      ]
    end

    it 'returns correctly sorted views' do
      expect(subject.sort_views).to eq expected_output
    end
  end

  describe '#sort_unique_views' do
    let(:expected_output) do
      [
        [url_one, counter_one], [url_two, counter_two]
      ]
    end

    it 'returns correctly sorted unique views' do
      expect(subject.sort_unique_views).to eq expected_output
    end
  end
end
