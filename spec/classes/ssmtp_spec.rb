require 'spec_helper'

describe "ssmtp" do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }

      case facts[:osfamily]
      when 'Debian'
        it { is_expected.to contain_class('ssmtp::package') }
        it { is_expected.to contain_class('ssmtp::config') }
        it { is_expected.to contain_class('ssmtp::service') }
        it { is_expected.to contain_file('/etc/ssmtp/ssmtp.conf') }
        it { is_expected.to contain_file('/etc/ssmtp/revaliases') }
        it { is_expected.to contain_package('ssmtp') }
      when 'RedHat'
        it { is_expected.to contain_class('ssmtp::package') }
        it { is_expected.to contain_class('ssmtp::config') }
        it { is_expected.to contain_class('ssmtp::service') }
        it { is_expected.to contain_file('/etc/ssmtp/ssmtp.conf') }
        it { is_expected.to contain_file('/etc/ssmtp/revaliases') }
        it { is_expected.to contain_package('ssmtp') }
      else
        it { is_expected.to contain_warning('The current operating system is not supported!') }
      end
    end
  end
end

at_exit { RSpec::Puppet::Coverage.report! }
