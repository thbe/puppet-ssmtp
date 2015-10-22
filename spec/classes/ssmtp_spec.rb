require 'spec_helper'

describe 'ssmtp', :type => :class do

  describe "ssmtp class with no parameters, basic test" do
    let(:params) { { } }

      it {
        should contain_package('ssmtp')
        should contain_file('/etc/ssmtp/ssmtp.conf')
        should contain_file('/etc/ssmtp/revaliases')
      }
  end
end
