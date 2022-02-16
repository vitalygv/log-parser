# frozen_string_literal: true

require 'spec_helper'

describe Validator do
  subject { described_class.new(file_path).call }

  describe '#call' do
    context 'when no argument provided' do
      let(:file_path) { nil }

      it 'raises an error' do
        expect { subject }.to raise_error(
          'No file provided'
        )
      end
    end

    context 'when argument is not a file' do
      let(:file_path) { 'not_a_file' }

      it 'raises an error' do
        expect { subject }.to raise_error(
          'Not a valid file'
        )
      end
    end

    context 'when file is empty' do
      let(:file_path) { 'spec/fixtures/empty_file.log' }

      it 'raises an error' do
        expect { subject }.to raise_error(
          'File is empty'
        )
      end
    end

    context 'when file is not a log' do
      let(:file_path) { 'spec/fixtures/not_a_log' }

      it 'raises an error' do
        expect { subject }.to raise_error(
          'File is not a log'
        )
      end
    end

    context 'when file is a log' do
      let(:file_path) { 'spec/fixtures/valid_file.log' }

      it 'returns nil' do
        expect(subject).to be nil
      end
    end
  end
end
