# frozen_string_literal: true

module Citizen
  class Role < ApplicationRecord
    validates :name, presence: true
    validate :capabilities_within_catalog

    scope :in_account, ->(account_id) { where(account_id: account_id) }

    private

    def capabilities_within_catalog
      known = Citizen.capabilities.map(&:to_s)
      (Array(capabilities).map(&:to_s) - known).each do |unknown|
        errors.add(:capabilities, "includes unknown capability: #{unknown}")
      end
    end
  end
end
