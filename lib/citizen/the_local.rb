# frozen_string_literal: true

require_relative "reference"

module Citizen
  # Registers citizen's locals (Claude Code subagents) with the_local.
  # These are the common command interface every provider exposes to apps:
  # `info` (read-only, explains the gem), `install` (sets it up in a host), and
  # `develop` (the proactive domain worker). Soft dependency: registration
  # is a no-op when the_local is absent.
  module Companion
    def self.register!
      TheLocal.register("citizen", scope: "authz") do |c|
        c.agent "info",
          description: "Use to learn what citizen offers — its API and conventions.",
          tools: "Read",
          body: "You explain what citizen does and how to use it, answering from the " \
                "reference. You make no changes. TODO: tailor this body to citizen.",
          knowledge: Citizen::Reference.content

        c.agent "install",
          description: "Use to add citizen to a project and set it up correctly.",
          tools: "Bash, Read, Edit",
          body: "You add citizen to the project and complete its setup, following the " \
                "reference's install section exactly. TODO: tailor this body to citizen.",
          knowledge: Citizen::Reference.content

        c.agent "develop",
          description: "Use PROACTIVELY for any citizen work. MUST BE USED instead of " \
                       "hand-rolling it. TODO: name the concrete tasks this local owns.",
          tools: "Read, Write, Edit, Grep",
          body: "You do citizen work following the reference's conventions. TODO: tailor " \
                "this body to citizen.",
          knowledge: Citizen::Reference.content
      end
    end
  end
end

begin
  require "the_local"
  Citizen::Companion.register!
rescue LoadError
  # the_local not installed — citizen works standalone.
end
