source "https://rubygems.org"

gem "rails", "~> 7.2.2", ">= 7.2.2.1"
gem "puma", ">= 5.0"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "jwt"
gem "bootstrap", "~> 5.3"
gem "simple_form"
gem "sassc-rails"
gem "importmap-rails", "~> 2.1"
gem "jsbundling-rails"
gem "stimulus-rails"
gem "kaminari", "~> 1.2"
gem "rspec-rails", "~> 8.0"
gem "grover", "~> 1.2.3"
gem "letter_opener", "~> 1.0"

# Utilisé uniquement en développement et test
group :development, :test do
  gem "sqlite3", ">= 1.4"
  gem "dotenv-rails"
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

# Utilisé uniquement en production
group :production do
  gem "pg"
end

group :development do
  gem 'sitemap_generator'
end


# Pour Windows ou JRuby uniquement
gem "tzinfo-data", platforms: %i[windows jruby]
