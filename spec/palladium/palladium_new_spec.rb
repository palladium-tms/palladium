# frozen_string_literal: true

require 'spec_helper'
require 'palladium'

RSpec.describe Palladium do
  describe '.new' do
    it 'creates a new Palladium instance' do
      palladium = described_class.new(host: 'example.com',
                                      token: 'sample_token')
      expect(palladium).to be_an_instance_of(Palladium::Palladium)
    end
  end
end
