# frozen_string_literal: true

require "test_helper"

module Citizen
  class CatalogTest < Minitest::Test
    def test_records_a_permission
      catalog = Catalog.new
      catalog.permission(:view_fulfillment)

      assert_includes catalog.permissions, :view_fulfillment
    end

    def test_records_a_metric
      catalog = Catalog.new
      catalog.metric(:revenue)

      assert_includes catalog.metrics, :revenue
    end
  end
end
