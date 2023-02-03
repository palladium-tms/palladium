# frozen_string_literal: true

require 'palladium/name'
require 'palladium/version'
require 'net/http'
require 'json'
require 'logger'
module Palladium
  def self.new(options = {})
    Palladium.new(options)
  end

  class Palladium
    attr_reader :host, :product, :plan, :run, :product_id,
                :plan_id, :run_id, :result_set_id, :port

    def initialize(options = {})
      @logger = Logger.new($stdout)
      @logger.level = options[:log] || 1
      @port = options[:port] || 443
      @http = Net::HTTP.new(options[:host], @port)
      @http.use_ssl = true if ssl_connection?
      @host = options[:host]
      @product = options[:product]
      @plan = options[:plan]
      @run = options[:run]
      @token = options[:token]
      @product_id, @run_id, @plan_id, @result_set_id = nil
    end

    def set_result(options = {})
      request = Net::HTTP::Post.new('/api/result_new',
                                    'Authorization' => @token,
                                    'Content-Type' => 'application/json')
      params = { plan_data: { product_name: @product, name: @plan },
                 run_data: { name: @run },
                 result_set_data: { name: options[:name] },
                 result_data: { message: options[:description], status: options[:status] } }
      params[:result_set_data][:run_id] = @run_id unless @run_id.nil?
      request.body = params.to_json
      result = JSON.parse(@http.request(request).body)
      if result['other_data']
        @run_id = result['other_data']['run_id']
        @product_id ||= result['other_data']['product_id']
        @plan_id ||= result['other_data']['plan_id']
        @result_set_id = result['other_data']['result_set_id']
      else
        @run_id = result['run']['id']
        @product_id ||= result['product']['id']
        @plan_id ||= result['plan']['id']
        @result_set_id = result['result_sets'][0]['id']
      end
      @result_set_link = result_set_link
      @logger.info "Palladium: Link to result: #{@result_set_link}"
      result
    end

    def get_result_sets(status)
      request = Net::HTTP::Post.new('/api/result_sets_by_status',
                                    'Authorization' => @token,
                                    'Content-Type' => 'application/json')
      request.body = { product_name: @product, plan_name: @plan, run_name: @run, status: status }.to_json
      result = JSON.parse(@http.request(request).body)
      @run_id = result['run']['id'] if result['run']
      @product_id ||= result['product']['id'] if result['product']
      @plan_id ||= result['plan']['id'] if result['plan']
      result['result_sets']
    end

    # get link to result set
    def result_set_link
      "http#{'s' if ssl_connection?}://#{@host}/product/#{@product_id}/" \
        "plan/#{@plan_id}/run/#{@run_id}/result_set/#{@result_set_id}"
    end

    private

    # Check if connection should be ssl
    # @return [True, False]
    def ssl_connection?
      @port == 443
    end
  end
end
