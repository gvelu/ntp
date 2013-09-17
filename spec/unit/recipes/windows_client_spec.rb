require 'spec_helper'

describe 'ntp::windows_client' do
  let(:chef_run) do
    runner = ChefSpec::ChefRunner.new(
      platform: 'windows',
      version: '2008R2'
    )
    runner.converge('recipe[ntp::windows_client]')
  end

  it 'creates the c:/NTP/etc directory' do
    pending('ChefSpec does not yet understand the inherits attribute in directory resources')
    expect(chef_run).to create_directory 'C:/NTP/etc'
  end

  it 'creates the c:/NTP/ntp.ini file' do
    pending('ChefSpec does not yet understand the inherits attribute in cookbook_file resources')
    expect(chef_run).to create_file 'C:/NTP/ntp.ini'
  end

  it 'Fetches the ntpd.exe via remote_file' do
    pending('ChefSpec does not yet understand the inherits attribute in cookbook_file resources')
    expect(chef_run).to create_remote_file("#{Chef::Config[:file_cache_path]}/ntpd.exe")
  end

  it 'Executes the ntpd installer' do
    pending('ChefSpec does not yet understand the inherits attribute in cookbook_file resources')
    expect(chef_run).to execute_command("#{Chef::Config[:file_cache_path]}\\ntpd.exe /USEFILE=C:\\NTP\\ntp.ini")
  end
end
