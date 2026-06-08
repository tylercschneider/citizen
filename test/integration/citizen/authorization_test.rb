# frozen_string_literal: true

require "test_helper"

module Citizen
  class AuthorizationTest < ActionDispatch::IntegrationTest
    test "can? helper is available in the view and reflects the member's capabilities" do
      member = ::Member.create!
      member.assign_role(Role.create!(account_id: 1, name: "Sales", capabilities: %w[revenue]))

      get "/reports", params: { member_id: member.id }

      assert_includes response.body, "revenue: true"
    end
  end
end
