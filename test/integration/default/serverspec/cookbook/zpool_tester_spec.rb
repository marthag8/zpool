require 'spec_helper'

context 'zpool_tester' do
  describe command('zpool list') do
    its(:stdout) { is_expected.to match(/createdzpool/) }
    its(:stdout) { is_expected.to match(/createdzpool_multiplevolumes/) }
    its(:stdout) { is_expected.not_to match(/destroyme_zpool/) }
  end
end
