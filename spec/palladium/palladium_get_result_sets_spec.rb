# frozen_string_literal: true

require 'spec_helper'
require 'palladium'

RSpec.describe Palladium do
  describe '#get_result_sets' do
    let(:http_double) { instance_double(Net::HTTP) }
    let(:response_body) do
      '{"run": {"id": 123}, "product": {"id": 456}, "plan": {"id": 789}, "result_sets": [{"id": 999}]}'
    end

    before do
      allow(Net::HTTP).to receive(:new).and_return(http_double)
      allow(http_double).to receive(:use_ssl=)
      allow(http_double).to receive(:request).and_return(instance_double(Net::HTTPResponse, body: response_body))
    end

    it 'sends a request to get result sets' do
      palladium = described_class.new(host: 'example.com', product: 'SampleProduct', plan: 'SamplePlan',
                                      run: 'SampleRun', token: 'sample_token')
      allow(palladium).to receive(:ssl_connection?).and_return(true)

      result_sets = palladium.get_result_sets('passed')

      expect(result_sets).to be_an(Array)
    end

    it 'includes the expected result set' do
      palladium = described_class.new(host: 'example.com', product: 'SampleProduct', plan: 'SamplePlan',
                                      run: 'SampleRun', token: 'sample_token')
      allow(palladium).to receive(:ssl_connection?).and_return(true)

      result_sets = palladium.get_result_sets('passed')

      expect(result_sets).to include({ 'id' => 999 })
    end

    it 'sets the run id' do
      palladium = described_class.new(host: 'example.com', product: 'SampleProduct', plan: 'SamplePlan',
                                      run: 'SampleRun', token: 'sample_token')
      allow(palladium).to receive(:ssl_connection?).and_return(true)

      palladium.get_result_sets('passed')

      expect(palladium.instance_variable_get(:@run_id)).to eq(123)
    end

    it 'sets the product id' do
      palladium = described_class.new(host: 'example.com', product: 'SampleProduct', plan: 'SamplePlan',
                                      run: 'SampleRun', token: 'sample_token')
      allow(palladium).to receive(:ssl_connection?).and_return(true)

      palladium.get_result_sets('passed')

      expect(palladium.instance_variable_get(:@product_id)).to eq(456)
    end

    it 'sets the plan id' do
      palladium = described_class.new(host: 'example.com', product: 'SampleProduct', plan: 'SamplePlan',
                                      run: 'SampleRun', token: 'sample_token')
      allow(palladium).to receive(:ssl_connection?).and_return(true)

      palladium.get_result_sets('passed')

      expect(palladium.instance_variable_get(:@plan_id)).to eq(789)
    end
  end
end
