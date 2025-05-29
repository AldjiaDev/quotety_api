source "https://rubygems.org"

gem "rails", "~> 7.2.2", ">= 7.2.2.1"

group :development, :test do
  gem "sqlite3", ">= 1.4"
end

gem "pg" # PostgreSQL pour la production
gem "puma", ">= 5.0"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "bootsnap", require: false
gem "jwt"
gem "bootstrap", "~> 5.3"
gem "simple_form"
gem "sassc-rails"
gem "dotenv-rails", groups: [:development, :test]
gem "importmap-rails", "~> 2.1"


group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

gem "rspec-rails", "~> 8.0"
gem "kaminari", "~> 1.2"
gem "jsbundling-rails"
