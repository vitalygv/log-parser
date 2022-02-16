# frozen_string_literal: true

require 'spec_helper'

describe Parser do
  subject { described_class.new(log_file) }

  let(:log_file) { 'log_file' }
  let(:counter) { instance_double(Counter) }

  describe '#call' do
    let(:same_url_line_one) { '/help_page/1 126.318.035.039' }
    let(:same_url_line_two) { '/help_page/1 126.318.035.039' }
    let(:different_url_line) { '/home 126.318.035.037' }

    before do
      expect(File).to receive(:foreach).with(log_file)
        .and_yield(same_url_line_one).and_yield(same_url_line_two).and_yield(different_url_line)
    end

    it 'returns correct count of views' do
      result = subject.call
      expect(result.fetch('/help_page/1').views).to eq 2
      expect(result.fetch('/help_page/1').unique_views).to eq 1
      expect(result.fetch('/home').views).to eq 1
      expect(result.fetch('/home').unique_views).to eq 1
    end
  end
end
