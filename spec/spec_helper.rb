# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  enable_coverage :branch
end

# Method to update instance variables of Palladium class
def update_instance_vars(palladium)
  palladium.instance_variable_set(:@product_id, 456)
  palladium.instance_variable_set(:@plan_id, 789)
  palladium.instance_variable_set(:@run_id, 123)
  palladium.instance_variable_set(:@result_set_id, 999)
end

def http_double_body_with_other
  '{"other_data": {"run_id": 123, "product_id": 456, "plan_id": 789, "result_set_id": 999}}'
end

def http_double_body_without_other
  '{"run": {"id": 123}, "product": {"id": 456}, "plan": {"id": 789}, "result_sets": [{"id": 999}]}'
end

def create_http_double(body)
  http_double = instance_double(Net::HTTP)
  allow(Net::HTTP).to receive(:new).and_return(http_double)
  allow(http_double).to receive(:use_ssl=)
  allow(http_double).to receive(:request).and_return(instance_double('response',
                                                                     body: body))
end
