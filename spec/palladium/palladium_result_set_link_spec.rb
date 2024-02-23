# frozen_string_literal: true

require 'spec_helper'
require 'palladium'

RSpec.describe Palladium do
  describe '#result_set_link' do
    it 'returns the correct result set link with ssl' do
      palladium = described_class.new(host: 'example.com', port: 443)
      update_instance_vars(palladium)
      expect(palladium.result_set_link).to eq('https://example.com/product/456/plan/789/run/123/result_set/999')
    end

    it 'returns the correct result set link without ssl' do
      palladium = described_class.new(host: 'example.com', port: 80)
      update_instance_vars(palladium)
      expect(palladium.result_set_link).to eq('http://example.com/product/456/plan/789/run/123/result_set/999')
    end
  end
end
