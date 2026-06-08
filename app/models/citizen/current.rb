# frozen_string_literal: true

module Citizen
  class Current < ActiveSupport::CurrentAttributes
    attribute :account_id
  end
end
