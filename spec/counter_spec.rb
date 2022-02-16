# frozen_string_literal: true

require 'spec_helper'

describe Counter do
  subject { described_class.new }

  let(:ips) { ['127.0.0.1', '127.0.0.1', '127.0.0.2'] }

  before { ips.each { |ip| subject.add_ip(ip) } }

  describe '#add_ip' do
    it 'counts total and unique views correctly' do
      expect(subject.views).to eq 3
      expect(subject.unique_views).to eq 2
    end
  end

  describe '#unique_views' do
    it 'returns unique views' do
      expect(subject.unique_views).to eq 2
    end
  end
end
