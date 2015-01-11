# Berkshelf API server that indexes the UIS organization on chefp01
source 'http://y0319t1027.nordstrom.net/'

cookbook 'kitchen_aide', path: '../kitchen_aide'
cookbook 'zpool_tester', path: 'test/integration/default/serverspec/cookbook/zpool_tester'
metadata

# load local overrides
# rubocop:disable Lint/Eval
berksfile_dir = File.absolute_path(File.join('.', 'lib', 'berksfile'))
Dir.glob(File.join(berksfile_dir, '*.berks')).each do |snippet|
  # rubocop:disable Lint/Eval
  eval File.read(snippet), nil, snippet
end
