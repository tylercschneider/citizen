# frozen_string_literal: true

module Citizen
  class Role < ApplicationRecord
    validates :name, presence: true
  end
end
