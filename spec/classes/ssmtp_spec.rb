require 'spec_helper'

describe 'ssmtp', :type => :class do

  describe "ssmtp class with no parameters, basic test" do
    let(:params) { { } }

      it { should contain_class('ssmtp::params') }
      it { should contain_class('ssmtp::package') }
      it { should contain_class('ssmtp::config') }
      it { should contain_class('ssmtp::service') }
      it { should contain_package('ssmtp') }
      it { should contain_file('/etc/ssmtp/ssmtp.conf') }
      it { should contain_file('/etc/ssmtp/revaliases') }
      it { shoudl contain_exec('alternatives --set mta /usr/sbin/sendmail.ssmtp') }

  end
end
