require "bundler/setup"

APP_RAKEFILE = File.expand_path("test/dummy/Rakefile", __dir__)
load "rails/tasks/engine.rake"

require "bundler/gem_tasks"

task test: "app:test"
task default: :test

# Render citizen's committed the_local agent files: `rake the_local:build`.
require "citizen"
require "the_local/rake"
