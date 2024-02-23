require 'spec_helper'
require 'palladium'

RSpec.describe Palladium do
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
end
