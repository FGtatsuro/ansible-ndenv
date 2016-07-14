require "spec_helper_#{ENV['SPEC_TARGET_BACKEND']}"

describe command("/bin/bash -lc 'ndenv versions'") do
  its(:stdout) { should contain('v0.10.40') }
  its(:stdout) { should contain('v0.12.4') }
end

describe command("/bin/bash -lc 'ndenv global'") do
  its(:stdout) { should contain('v0.10.40') }
  its(:stdout) { should_not contain('v0.12.4') }
end

describe command("/bin/bash -lc 'node --version'") do
  its(:stdout) { should contain('v0.10.40') }
  its(:stdout) { should_not contain('v0.12.4') }
end

# Check whether variables of 'FGtatsuro.anyenv' affects the behavior of this role properly.
describe file("#{ENV['ANY_ENV_HOME']}/.anyenv/envs/ndenv/bin/ndenv") do
  it { should exist }
end

#describe command('source /Users/travis/.profile && ndenv versions'), :if => os[:family] == 'darwin' do
#  its(:stdout) { should contain('v0.10.40') }
#  its(:stdout) { should contain('v0.12.4') }
#end
