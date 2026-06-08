# frozen_string_literal: true

module Citizen
  class Role < ApplicationRecord
    validates :name, presence: true

    scope :in_account, ->(account_id) { where(account_id: account_id) }
  end
end
