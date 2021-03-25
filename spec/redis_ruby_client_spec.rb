# frozen_string_literal: true

require 'spec_helper'

RSpec.describe RedisClient do
  subject { described_class.new }
  let(:cache_data) { { a: [1, 2, 3], b: {a: String.new, b: { a: [1, 2, 3] } } } }

  it 'has a version number' do
    expect(RedisRubyClient::VERSION).not_to be nil
  end

  describe '#read' do
    context 'when data exists in cache' do
      before do
        allow_any_instance_of(Redis).to receive(:get).with(:a).and_return(cache_data)
      end

      it 'returns cached data' do
        expect(subject.read(:a)).to eq cache_data
      end
    end
  end
end
