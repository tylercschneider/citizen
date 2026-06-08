# frozen_string_literal: true

module Citizen
  class Role < ApplicationRecord
    validates :name, presence: true
    validate :capabilities_within_catalog

    scope :in_account, ->(account_id) { where(account_id: account_id) }

    def self.from_template(account_id:, template:)
      definition = Citizen.templates.find(template)
      create!(account_id: account_id, name: definition.name.to_s.titleize, capabilities: definition.capabilities)
    end

    private

    def capabilities_within_catalog
      known = Citizen.capabilities.map(&:to_s)
      (Array(capabilities).map(&:to_s) - known).each do |unknown|
        errors.add(:capabilities, "includes unknown capability: #{unknown}")
      end
    end
  end
end
