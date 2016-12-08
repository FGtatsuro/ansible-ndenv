require "spec_helper_#{ENV['SPEC_TARGET_BACKEND']}"

if ENV['TARGET_HOST'].include?('container') then
  command_base = "su -l -s /bin/bash -c '%s' #{ENV['ANYENV_OWNER']}"
else
  command_base = "/bin/bash -lc '%s'"
end

describe command(command_base % 'ndenv versions') do
  its(:stdout) { should contain('v0.10.40') }
  its(:stdout) { should contain('v0.12.4') }
end

describe command(command_base % 'ndenv global') do
  its(:stdout) { should contain('v0.10.40') }
  its(:stdout) { should_not contain('v0.12.4') }
end

describe command(command_base % 'node --version') do
  its(:stdout) { should contain('v0.10.40') }
  its(:stdout) { should_not contain('v0.12.4') }
end

# Check whether variables of 'FGtatsuro.anyenv' affects the behavior of this role properly.
describe file("#{ENV['ANYENV_HOME']}/.anyenv/envs/ndenv/bin/ndenv") do
  it { should exist }
end
