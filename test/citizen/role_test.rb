# frozen_string_literal: true

require "test_helper"

module Citizen
  class RoleTest < ActiveSupport::TestCase
    test "stores its capabilities" do
      role = Role.create!(account_id: 1, name: "Sales Associate", capabilities: %w[revenue deals])

      assert_equal %w[revenue deals], role.reload.capabilities
    end
  end
end
