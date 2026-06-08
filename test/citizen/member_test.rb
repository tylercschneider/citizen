# frozen_string_literal: true

require "test_helper"

module Citizen
  class MemberTest < ActiveSupport::TestCase
    test "assigning a role makes it one of the member's roles" do
      role = Role.create!(account_id: 1, name: "Sales", capabilities: %w[revenue])
      member = ::Member.create!

      member.assign_role(role)

      assert_includes member.citizen_roles, role
    end
  end
end
