# frozen_string_literal: true

require "test_helper"
require "the_local"
require "citizen/the_local"

module Citizen
  class CompanionTest < Minitest::Test
    def setup
      TheLocal.reset!
      Citizen::Companion.register!
    end

    def test_registers_the_common_command_interface
      assert_equal ["citizen-info", "citizen-install", "citizen-develop"],
        TheLocal.registry.agents.map(&:qualified_name)
    end

    def test_each_local_embeds_the_reference
      assert(TheLocal.registry.agents.all? { |a| a.to_markdown.include?(Citizen::Reference.content) })
    end
  end
end
