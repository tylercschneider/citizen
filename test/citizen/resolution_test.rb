# frozen_string_literal: true

require "test_helper"

module Citizen
  class ResolutionTest < Minitest::Test
    def test_can_is_true_when_the_grants_include_the_capability
      assert Citizen.can?(%i[view_fulfillment revenue], :view_fulfillment)
    end
  end
end
