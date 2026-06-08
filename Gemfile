source "https://rubygems.org"

# Specify your gem's dependencies in citizen.gemspec.
gemspec

# Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
gem "rubocop-rails-omakase", require: false

group :development, :test do
  gem "puma"
  gem "sqlite3"
  gem "propshaft"
  gem "pry"
  gem "minitest", "~> 5.0"

  # Optional companion: citizen registers its locals with the_local when present.
  # Registration is guarded, so citizen works standalone.
  gem "the_local", github: "tylercschneider/the_local"
end
