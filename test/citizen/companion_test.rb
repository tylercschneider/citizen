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
      assert_equal [ "citizen-info", "citizen-install", "citizen-develop" ],
        TheLocal.registry.agents.map(&:qualified_name)
    end

    def test_each_local_embeds_the_reference
      assert(TheLocal.registry.agents.all? { |a| a.to_markdown.include?(Citizen::Reference.content) })
    end

    # The committed .md files (the_local copies them verbatim into a host) must
    # stay in sync with the registration. Re-run `rake the_local:build` if this
    # fails after editing an agent or the reference.
    def test_committed_agent_files_match_the_registration
      TheLocal.registry.agents.each do |agent|
        assert_equal agent.to_markdown, File.read(agent.source_path)
      end
    end
  end
end
