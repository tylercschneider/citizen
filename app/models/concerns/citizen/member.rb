# frozen_string_literal: true

module Citizen
  module Member
    extend ActiveSupport::Concern

    included do
      has_many :citizen_assignments, as: :member, class_name: "Citizen::Assignment", dependent: :destroy
      has_many :citizen_roles, through: :citizen_assignments, source: :role
    end

    def assign_role(role)
      citizen_assignments.find_or_create_by(role: role)
    end

    def revoke_role(role)
      citizen_assignments.where(role: role).destroy_all
    end

    def capabilities(account_id: nil)
      roles = account_id ? citizen_roles.where(account_id: account_id) : citizen_roles
      roles.flat_map(&:capabilities).uniq.map(&:to_sym)
    end

    def can?(capability, account_id: nil)
      Citizen.can?(capabilities(account_id: account_id), capability)
    end

    def approved_metrics(account_id: nil)
      Citizen.approved_metrics(capabilities(account_id: account_id))
    end
  end
end
