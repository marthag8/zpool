source 'http://rubygems.nordstrom.net'

group :test do
  gem 'rake', '~> 10.3'
  gem 'foodcritic', '~> 4.0'
  gem 'chefspec', '~> 4.1'
  gem 'ci_reporter_rspec', '~> 1.0'
  gem 'test-kitchen', '~> 1.2'
  gem 'kitchen-vagrant', '~> 0.15'
  # log_switch v1.0.0 breaks tailor v1.4.0 but tailor
  # does a >= pin; we add a ~> pin for now to keep us
  # on the 0.4.x release
  gem 'log_switch', '~> 0.4'
  gem 'tailor', '~> 1.4'
  gem 'berkshelf', '~> 3.1'
  gem 'guard', '~> 2.6'
  gem 'guard-rspec', '~> 4.2'
  gem 'guard-foodcritic', '~> 1.0'
  gem 'guard-rake', '~> 0.0'
end

# load local overrides
gemfile_dir = File.absolute_path(File.join('.', 'lib', 'gemfile'))
Dir.glob(File.join(gemfile_dir, '*.bundler')).each do |snippet|
  # rubocop:disable Lint/Eval
  eval File.read(snippet), nil, snippet
end
