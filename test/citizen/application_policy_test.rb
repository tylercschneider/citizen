# frozen_string_literal: true

require "test_helper"

module Citizen
  class ApplicationPolicyTest < ActiveSupport::TestCase
    StubMember = Struct.new(:granted) do
      def can?(capability)
        granted.include?(capability)
      end
    end

    test "can? delegates the capability check to the member" do
      policy = ApplicationPolicy.new(StubMember.new(%i[revenue]), :report)

      assert policy.can?(:revenue)
    end
  end
end
