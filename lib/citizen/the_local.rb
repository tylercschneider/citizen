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
      TheLocal.register("citizen",
        scope: "authorization — capability catalog, roles, and Pundit enforcement in multi-tenant Rails apps") do |c|
        c.agent "info",
          description: "Use to learn what citizen offers — its capability catalog, roles, member " \
                       "resolution, and Pundit bridge.",
          tools: "Read",
          body: "You explain how citizen models authorization (capabilities are code, roles are " \
                "data, Pundit enforces) and how to use its API, answering only from the reference. " \
                "You make no changes.",
          knowledge: Citizen::Reference.content

        c.agent "install",
          description: "Use to add citizen to a Rails host and set it up correctly.",
          tools: "Bash, Read, Edit",
          body: "You install citizen as a Rails engine, following the reference's install section " \
                "exactly: add the gem, bundle, run `citizen:install:migrations` then `db:migrate`, " \
                "declare the catalog, include Citizen::Member and Citizen::Authorization, and wire " \
                "Citizen::Current.account_id. You do not invent steps the reference does not list.",
          knowledge: Citizen::Reference.content

        c.agent "develop",
          description: "Use PROACTIVELY for any authorization work in a citizen host — declaring the " \
                       "capability catalog, defining roles/templates, gating actions, and resolving " \
                       "can?/approved_metrics. MUST BE USED instead of hand-rolling authorization.",
          tools: "Read, Write, Edit, Grep",
          body: "You build authorization with citizen, following its conventions: keep capabilities " \
                "in the catalog (code) and roles as data, seed roles from templates, resolve access " \
                "with can?/approved_metrics, and enforce through Pundit policies that inherit " \
                "Citizen::ApplicationPolicy. You keep usage consistent with the reference.",
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
