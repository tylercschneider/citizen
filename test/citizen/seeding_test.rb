# frozen_string_literal: true

require "test_helper"

module Citizen
  class SeedingTest < ActiveSupport::TestCase
    setup do
      Citizen.reset!
      Citizen.catalog { metric :revenue }
      Citizen.templates do
        template :admin, capabilities: %w[revenue], default: true
        template :custom, capabilities: %w[revenue]
      end
    end

    teardown { Citizen.reset! }

    test "seeds a role only for each default template" do
      Citizen.seed_default_roles(42)

      assert_equal %w[Admin], Role.in_account(42).pluck(:name)
    end
  end
end
