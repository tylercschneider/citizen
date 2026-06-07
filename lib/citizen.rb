# frozen_string_literal: true

require_relative "citizen/version"
require_relative "citizen/catalog"

module Citizen
  class Error < StandardError; end

  def self.catalog(&block)
    @catalog ||= Catalog.new
    @catalog.instance_eval(&block) if block
    @catalog
  end

  def self.reset!
    @catalog = nil
  end
end
