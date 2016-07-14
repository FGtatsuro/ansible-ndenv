require "spec_helper_#{ENV['SPEC_TARGET_BACKEND']}"

describe command("su -s /bin/bash -c 'ndenv versions' - #{ENV['ANYENV_OWNER']}") do
  its(:stdout) { should contain('v0.10.40') }
  its(:stdout) { should contain('v0.12.4') }
end

describe command("su -s /bin/bash -c 'ndenv global' - #{ENV['ANYENV_OWNER']}") do
  its(:stdout) { should contain('v0.10.40') }
  its(:stdout) { should_not contain('v0.12.4') }
end

describe command("su -s /bin/bash -c 'node --version' - #{ENV['ANYENV_OWNER']}") do
  its(:stdout) { should contain('v0.10.40') }
  its(:stdout) { should_not contain('v0.12.4') }
end

# Check whether variables of 'FGtatsuro.anyenv' affects the behavior of this role properly.
describe file("#{ENV['ANYENV_HOME']}/.anyenv/envs/ndenv/bin/ndenv") do
  it { should exist }
end

#describe command('source /Users/travis/.profile && ndenv versions'), :if => os[:family] == 'darwin' do
#  its(:stdout) { should contain('v0.10.40') }
#  its(:stdout) { should contain('v0.12.4') }
#end
