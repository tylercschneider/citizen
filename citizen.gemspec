# frozen_string_literal: true

require_relative "lib/citizen/version"

Gem::Specification.new do |spec|
  spec.name = "citizen"
  spec.version = Citizen::VERSION
  spec.authors = ["tylercschneider"]
  spec.email = ["tylercschneider@gmail.com"]

  spec.summary = "Capability-based authorization: roles grant capabilities, Pundit enforces"
  spec.description = "Citizen is the authorization layer for multi-tenant apps. The app declares a " \
    "fixed catalog of capabilities (permission + metric keys) in code; accounts manage roles as data " \
    "that bundle those capabilities; Citizen resolves what a member may do (can?) and which metrics " \
    "they may see (approved_metrics) from their roles, and plugs into Pundit for enforcement. It owns " \
    "no role storage — hosts bring their own (rolify, AccountUser roles) via an injectable resolver."
  spec.homepage = "https://github.com/tylercschneider/citizen"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"] = "#{spec.homepage}/issues"
  spec.metadata["rubygems_mfa_required"] = "true"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore test/ .github/ .rubocop.yml docs/])
    end
  end
  spec.require_paths = ["lib"]
end
