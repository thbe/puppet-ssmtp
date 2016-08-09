require 'spec_helper'

describe "ssmtp" do

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      let(:params) {
        {
          :default_mta => 'ssmtp',
          :root_email => 'test@example.local',
          :mail_hub => 'mh.example.local'
        }
      }

      it { is_expected.to compile.with_all_deps }

      case facts[:osfamily]
      when 'Debian'
        it { is_expected.to contain_class('ssmtp::package') }
        it { is_expected.to contain_class('ssmtp::config') }
        it { is_expected.to contain_class('ssmtp::service') }
        it do
          is_expected.to contain_file('/etc/ssmtp/ssmtp.conf').with(
            'ensure'  => 'file',
            'owner'   => 'root',
            'group'   => 'mail',
            'mode'    => '0640',
          )
        end
        it do
          is_expected.to contain_file('/etc/ssmtp/revaliases').with(
            'ensure'  => 'file',
            'owner'   => 'root',
            'group'   => 'root',
            'mode'    => '0644',
          )
        end
        it { is_expected.to contain_package('ssmtp') }

        it 'should generate valid content for ssmtp.conf' do
            content = catalogue.resource('file', '/etc/ssmtp/ssmtp.conf').send(:parameters)[:content]
            expect(content).to match('ssmtp')
            expect(content).to match('test@example.local')
            expect(content).to match('mh.example.local')
            expect(content).to match('YES')
        end
      when 'RedHat'
        it { is_expected.to contain_class('ssmtp::package') }
        it { is_expected.to contain_class('ssmtp::config') }
        it { is_expected.to contain_class('ssmtp::service') }
        it do
          is_expected.to contain_file('/etc/ssmtp/ssmtp.conf').with(
            'ensure'  => 'file',
            'owner'   => 'root',
            'group'   => 'mail',
            'mode'    => '0644',
          )
        end
        it do
          is_expected.to contain_file('/etc/ssmtp/revaliases').with(
            'ensure'  => 'file',
            'owner'   => 'root',
            'group'   => 'root',
            'mode'    => '0644',
          )
        end
        it { is_expected.to contain_package('ssmtp') }

        it 'should generate valid content for ssmtp.conf' do
            content = catalogue.resource('file', '/etc/ssmtp/ssmtp.conf').send(:parameters)[:content]
            expect(content).to match('ssmtp')
            expect(content).to match('test@example.local')
            expect(content).to match('mh.example.local')
            expect(content).to match('YES')
        end
      else
        it { is_expected.to contain_warning('The current operating system is not supported!') }
      end
    end
  end
end
