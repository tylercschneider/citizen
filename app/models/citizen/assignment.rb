# frozen_string_literal: true

module Citizen
  class Assignment < ApplicationRecord
    belongs_to :member, polymorphic: true
    belongs_to :role, class_name: "Citizen::Role"
  end
end
