require 'spec_helper'
require 'palladium'

RSpec.describe Palladium do
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
