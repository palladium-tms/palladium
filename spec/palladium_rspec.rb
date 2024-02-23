require 'spec_helper'
require 'palladium'

RSpec.describe Palladium do
  describe '.new' do
    it 'creates a new Palladium instance' do
      palladium = Palladium.new(host: 'example.com', product: 'SampleProduct', plan: 'SamplePlan', run: 'SampleRun', token: 'sample_token')
      expect(palladium).to be_an_instance_of(Palladium::Palladium)
    end
  end

  describe '#set_result' do
    it 'sends a request to set the result' do
      options = {
        name: 'Sample Result',
        description: 'This is a sample result',
        status: 'passed'
      }

      http_double = double('Net::HTTP')
      allow(Net::HTTP).to receive(:new).and_return(http_double)
      allow(http_double).to receive(:use_ssl=)
      allow(http_double).to receive(:request).and_return(double('response', body: '{"other_data": {"run_id": 123, "product_id": 456, "plan_id": 789, "result_set_id": 999}}'))

      palladium = Palladium.new(host: 'example.com', product: 'SampleProduct', plan: 'SamplePlan', run: 'SampleRun', token: 'sample_token')
      allow(palladium).to receive(:ssl_connection?).and_return(true)

      result = palladium.set_result(options)

      expect(result).to include('other_data')
      expect(palladium.instance_variable_get(:@run_id)).to eq(123)
      expect(palladium.instance_variable_get(:@product_id)).to eq(456)
      expect(palladium.instance_variable_get(:@plan_id)).to eq(789)
      expect(palladium.instance_variable_get(:@result_set_id)).to eq(999)
    end
  end

  describe '#get_result_sets' do
    it 'sends a request to get result sets' do
      http_double = double('Net::HTTP')
      allow(Net::HTTP).to receive(:new).and_return(http_double)
      allow(http_double).to receive(:use_ssl=)
      allow(http_double).to receive(:request).and_return(double('response', body: '{"run": {"id": 123}, "product": {"id": 456}, "plan": {"id": 789}, "result_sets": [{"id": 999}]}'))

      palladium = Palladium.new(host: 'example.com', product: 'SampleProduct', plan: 'SamplePlan', run: 'SampleRun', token: 'sample_token')
      allow(palladium).to receive(:ssl_connection?).and_return(true)

      result_sets = palladium.get_result_sets('passed')

      expect(result_sets).to be_an(Array)
      expect(result_sets).to include({"id" => 999})
      expect(palladium.instance_variable_get(:@run_id)).to eq(123)
      expect(palladium.instance_variable_get(:@product_id)).to eq(456)
      expect(palladium.instance_variable_get(:@plan_id)).to eq(789)
    end
  end

  describe '#result_set_link' do
    it 'returns the correct result set link' do
      palladium = Palladium.new(host: 'example.com', product: 'SampleProduct', plan: 'SamplePlan', run: 'SampleRun', token: 'sample_token')
      allow(palladium).to receive(:ssl_connection?).and_return(true)
      palladium.instance_variable_set(:@product_id, 456)
      palladium.instance_variable_set(:@plan_id, 789)
      palladium.instance_variable_set(:@run_id, 123)
      palladium.instance_variable_set(:@result_set_id, 999)

      link = palladium.result_set_link

      expect(link).to eq('https://example.com/product/456/plan/789/run/123/result_set/999')
    end
  end
end
