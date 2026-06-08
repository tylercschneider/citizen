# frozen_string_literal: true

require "test_helper"

module Citizen
  class TemplatesTest < Minitest::Test
    def test_declares_a_named_template_with_capabilities
      Citizen.reset!
      Citizen.templates do
        template :sales, capabilities: %w[revenue deals]
      end

      assert_equal %w[revenue deals], Citizen.templates.find(:sales).capabilities
    ensure
      Citizen.reset!
    end

    def test_defaults_returns_only_templates_flagged_default
      Citizen.reset!
      Citizen.templates do
        template :admin, capabilities: %w[revenue], default: true
        template :custom, capabilities: %w[revenue]
      end

      assert_equal %i[admin], Citizen.templates.defaults.map(&:name)
    ensure
      Citizen.reset!
    end
  end
end
