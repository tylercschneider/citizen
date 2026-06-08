# frozen_string_literal: true

require "pundit"

module Citizen
  module Authorization
    extend ActiveSupport::Concern

    included do
      include Pundit::Authorization
      helper_method :can?
    end

    def can?(capability)
      current_member&.can?(capability) || false
    end
  end
end
