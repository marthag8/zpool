# rubocop: disable Style/RegexpLiteral
# rubocop: disable Lint/Eval
# prevent dropping into pry when nothing is happening
interactor :off

# automatically runs Foodcritic
guard :foodcritic, cookbook_paths: '.', cli: '-f any' do
  watch(%r{^attributes/.+\.rb$})
  watch(%r{^resources/.+\.rb$})
  watch(%r{^providers/.+\.rb$})
  watch(%r{^libraries/.+\.rb$})
  watch(%r{^recipes/.+\.rb$})
  watch(%r{^recipes_tests/.+\.rb$})
  watch(%r{^metadata\.rb$})
end

# automatically runs Tailor
guard :rake, task: :tailor do
  watch(%r{^spec/zpool/.+_spec\.rb$})
  watch(%r{^spec/spec_helper\.rb$})
  watch(%r{^attributes/.+\.rb$})
  watch(%r{^resources/.+\.rb$})
  watch(%r{^providers/.+\.rb$})
  watch(%r{^libraries/.+\.rb$})
  watch(%r{^recipes/.+\.rb$})
  watch(%r{^recipes_tests/.+\.rb$})
  watch(%r{^metadata\.rb$})
end

# automatically runs ChefSpec tests
guard :rspec, cmd: 'bundle exec rspec' do
  watch(%r{^spec/zpool/.+_spec\.rb$})
  watch(%r{^spec/spec_helper\.rb$}) { 'spec' }
  watch(%r{^attributes/.+\.rb$})    { 'spec' }
  watch(%r{^resources/.+\.rb$})     { 'spec' }
  watch(%r{^providers/.+\.rb$})     { 'spec' }
  watch(%r{^libraries/.+\.rb$})     { 'spec' }
  watch(%r{^recipe_tests/.+\.rb$})  { 'spec' }
  watch(%r{^recipes/(.+)\.rb$})     { |m| "spec/zpool/#{m[1]}_spec.rb" }
end

# load local overrides
guardfile_dir = File.absolute_path(File.join('.', 'lib', 'guardfile'))
Dir.glob(File.join(guardfile_dir, '*.guard')).each do |snippet|
  eval File.read(snippet), nil, snippet
end
