# frozen_string_literal: true

require "test_helper"

module Citizen
  class ResolutionTest < Minitest::Test
    def test_can_is_true_when_the_grants_include_the_capability
      assert Citizen.can?(%i[view_fulfillment revenue], :view_fulfillment)
    end

    def test_approved_metrics_are_the_granted_catalog_metrics
      Citizen.reset!
      Citizen.catalog do
        permission :view_fulfillment
        metric :revenue
        metric :deals
      end

      assert_equal %i[revenue], Citizen.approved_metrics(%i[view_fulfillment revenue])
    ensure
      Citizen.reset!
    end
  end
end
