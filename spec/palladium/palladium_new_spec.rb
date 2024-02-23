require 'spec_helper'
require 'palladium'

RSpec.describe Palladium do
  describe '.new' do
    it 'creates a new Palladium instance' do
      palladium = Palladium.new(host: 'example.com', product: 'SampleProduct', plan: 'SamplePlan', run: 'SampleRun', token: 'sample_token')
      expect(palladium).to be_an_instance_of(Palladium::Palladium)
    end
  end
end
