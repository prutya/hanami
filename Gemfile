source 'https://rubygems.org'
gemspec

unless ENV['CI']
  gem 'byebug', require: false, platforms: :mri
  gem 'yard',   require: false
end

gem 'i18n'

gem 'hanami-utils',       '~> 1.3', require: false, git: 'https://github.com/prutya/hanami-utils.git',       branch: '1.3.x'
gem 'hanami-validations', '~> 1.3', require: false, git: 'https://github.com/prutya/hanami-validations.git', branch: '1.3.x'
gem 'hanami-router',      '~> 1.3', require: false, git: 'https://github.com/prutya/hanami-router.git',      branch: '1.3.x'
gem 'hanami-controller',  '~> 1.3', require: false, git: 'https://github.com/prutya/hanami-controller.git',  branch: '1.3.x'
gem 'hanami-view',        '~> 1.3', require: false, git: 'https://github.com/prutya/hanami-view.git',        branch: '1.3.x'
gem 'hanami-model',       '~> 1.3', require: false, git: 'https://github.com/prutya/hanami-model.git',       branch: '1.3.x'
gem 'hanami-helpers',     '~> 1.3', require: false, git: 'https://github.com/prutya/hanami-helpers.git',     branch: '1.3.x'
gem 'hanami-mailer',      '~> 1.3', require: false, git: 'https://github.com/prutya/hanami-mailer.git',      branch: '1.3.x'
gem 'hanami-assets',      '~> 1.3', require: false, git: 'https://github.com/prutya/hanami-assets.git',      branch: '1.3.x'

platforms :ruby do
  gem 'sqlite3'
end

platforms :jruby do
  gem 'jdbc-sqlite3'
end

# `hanami console` integration tests
gem 'pry',  require: false
gem 'ripl', require: false

# `hanami server` integration tests
gem 'puma',    require: false
gem 'unicorn', require: false, platforms: :ruby

if RUBY_DESCRIPTION =~ /linux/
  gem 'therubyracer', require: false, platforms: :ruby
  gem 'therubyrhino', require: false, platforms: :jruby
end

# `hanami assets` integration tests
gem 'sassc',         require: false
gem 'coffee-script', require: false

gem 'dotenv',    '~> 2.4', require: false
gem 'shotgun',   '~> 0.9', require: false

gem 'hanami-devtools', require: false, git: 'https://github.com/prutya/hanami-devtools.git', branch: '1.3.x'
gem 'hanami-webconsole', require: false, git: 'https://github.com/prutya/hanami-webconsole.git', branch: '1.0.x'

# https://github.com/hanami/hanami/issues/893
gem 'builder'
