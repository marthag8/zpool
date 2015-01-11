require 'foodcritic'
require 'foodcritic/rake_task'
# require 'tailor/rake_task'
# require 'rspec/core/rake_task'

# require 'kitchen/rake_tasks'

# if we are running inside the CI pipeline, turn on
# xUnit-style test reports
if ENV.key?('CI_BUILD')
  require 'ci/reporter/rake/rspec'
  task spec: 'ci:setup:rspec'
end

task default: 'foodcritic'

desc 'Runs foodcritic linter'
task :foodcritic do
  Rake::Task[:prepare_sandbox].execute

  if Gem::Version.new('1.9.2') <= Gem::Version.new(RUBY_VERSION.dup)
    sh "foodcritic -f any #{sandbox_path}"
  else
    puts "WARN: foodcritic run is skipped as Ruby #{RUBY_VERSION} is < 1.9.2."
  end
end

desc 'Runs knife cookbook test'
task :knife do
  Rake::Task[:prepare_sandbox].execute

  sh "bundle exec knife cookbook test zpool -o #{sandbox_path}/../"
end

task :prepare_sandbox do
  files = %w(*.md *.rb attributes definitions libraries files providers recipes resources templates)

  rm_rf sandbox_path
  mkdir_p sandbox_path
  cp_r Dir.glob("{#{files.join(',')}}"), sandbox_path
end

private

def sandbox_path
  File.join(File.dirname(__FILE__), %w(tmp cookbooks cookbook))
end
