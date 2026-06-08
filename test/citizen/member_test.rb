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

    test "capabilities is the union of assigned roles' capabilities as symbols" do
      sales = Role.create!(account_id: 1, name: "Sales", capabilities: %w[revenue])
      support = Role.create!(account_id: 1, name: "Support", capabilities: %w[revenue tickets])
      member = ::Member.create!

      member.assign_role(sales)
      member.assign_role(support)

      assert_equal %i[revenue tickets], member.capabilities.sort
    end

    test "can? is true only for capabilities the member's roles grant" do
      role = Role.create!(account_id: 1, name: "Sales", capabilities: %w[revenue])
      member = ::Member.create!
      member.assign_role(role)

      assert member.can?(:revenue)
      assert_not member.can?(:expenses)
    end
  end
end
