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

    describe 'ssl connection' do
      it 'uses ssl' do
        palladium = described_class.new(host: 'example.com',
                                        port: 443)
        expect(palladium.instance_variable_get(:@http).use_ssl?).to be true
      end

      it 'do not uses ssl' do
        palladium = described_class.new(host: 'example.com',
                                        port: 80)
        expect(palladium.instance_variable_get(:@http).use_ssl?).to be false
      end
    end
  end
end
