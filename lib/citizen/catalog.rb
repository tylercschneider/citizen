# frozen_string_literal: true

module Citizen
  class Catalog
    attr_reader :permissions

    def initialize
      @permissions = []
    end

    def permission(key)
      @permissions << key
    end
  end
end
