# frozen_string_literal: true

require 'spec_helper'
require 'palladium'

RSpec.describe Palladium do
  let(:options) do
    {
      name: 'Sample Result',
      description: 'This is a sample result',
      status: 'passed'
    }
  end

  let(:palladium) { described_class.new(host: 'example.com') }

  let(:result) { palladium.set_result(options) }

  describe 'With other body' do
    before do
      create_http_double(http_double_body_with_other)
      allow(palladium).to receive(:instance_variable_get).with(:@run_id).and_return(123)
      allow(palladium).to receive(:instance_variable_get).with(:@product_id).and_return(456)
      allow(palladium).to receive(:instance_variable_get).with(:@plan_id).and_return(789)
      allow(palladium).to receive(:instance_variable_get).with(:@result_set_id).and_return(999)
    end

    describe '#set_result' do
      it 'result includes request data' do
        expect(result).to include('other_data')
      end

      it 'result run id is correct' do
        expect(palladium.instance_variable_get(:@run_id)).to eq(123)
      end

      it 'result product id is correct' do
        expect(palladium.instance_variable_get(:@product_id)).to eq(456)
      end

      it 'result plan id is correct' do
        expect(palladium.instance_variable_get(:@plan_id)).to eq(789)
      end

      it 'result set id is correct' do
        expect(palladium.instance_variable_get(:@result_set_id)).to eq(999)
      end
    end
  end

  describe 'Without other body' do
    before do
      create_http_double(http_double_body_without_other)
      allow(palladium).to receive(:instance_variable_get).with(:@run_id).and_return(123)
      allow(palladium).to receive(:instance_variable_get).with(:@product_id).and_return(456)
      allow(palladium).to receive(:instance_variable_get).with(:@plan_id).and_return(789)
      allow(palladium).to receive(:instance_variable_get).with(:@result_set_id).and_return(999)
    end

    describe '#set_result' do
      it 'result includes request data' do
        expect(result).not_to include('other_data')
      end

      it 'result run id is correct' do
        expect(palladium.instance_variable_get(:@run_id)).to eq(123)
      end

      it 'result product id is correct' do
        expect(palladium.instance_variable_get(:@product_id)).to eq(456)
      end

      it 'result plan id is correct' do
        expect(palladium.instance_variable_get(:@plan_id)).to eq(789)
      end

      it 'result set id is correct' do
        expect(palladium.instance_variable_get(:@result_set_id)).to eq(999)
      end
    end
  end
end
