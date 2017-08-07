require 'palladium/version'
require 'net/http'
require 'json'
module Palladium
  def self.new(options = {})
   Palladium.new(options)
  end

  class Palladium
    def initialize(options = {})
      options[:port] ||= 80
      @http = Net::HTTP.new(options[:host], options[:port])
      @product = options[:product]
      @plan = options[:plan]
      @run = options[:run]
      @token = options[:token]
      @run_id = nil
    end

    def set_result(options = {})
      request = Net::HTTP::Post.new('/api/result_new', 'Authorization' => @token)
      params = { 'plan_data[product_name]' => @product,
                 'plan_data[name]' => @plan,
                 'run_data[name]' => 'multiplication_products1',
                 'result_set_data[name]' => options[:name],
                 'result_data[message]' => options[:description],
                 'result_data[status]' => options[:status] }
      params['result_set_data[run_id]'] = @run_id unless @run_id.nil?
      request.set_form_data(params)
      result = JSON.parse(@http.request(request).body)
      @run_id = result['run_id']
      result
    end
  end
end
