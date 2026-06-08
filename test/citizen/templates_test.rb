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
  end
end
