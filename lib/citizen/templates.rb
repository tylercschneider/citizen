# frozen_string_literal: true

module Citizen
  class Templates
    Template = Struct.new(:name, :capabilities, :default, keyword_init: true)

    def initialize
      @templates = []
    end

    def template(name, capabilities:, default: false)
      @templates << Template.new(name: name, capabilities: capabilities, default: default)
    end

    def find(name)
      @templates.find { |template| template.name == name }
    end

    def defaults
      @templates.select(&:default)
    end

    def all
      @templates
    end
  end
end
