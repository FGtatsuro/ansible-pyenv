require "spec_helper_#{ENV['SPEC_TARGET_BACKEND']}"

if ENV['TARGET_HOST'].include?('container') then
  command_base = "su -s /bin/bash -c '%s' - #{ENV['ANYENV_OWNER']}"
else
  command_base = "/bin/bash -lc '%s'"
end


describe command(command_base % 'pyenv versions') do
  its(:stdout) { should contain('2.7.12') }
  its(:stdout) { should contain('3.5.2') }
end

describe command(command_base % 'pyenv global') do
  its(:stdout) { should contain('2.7.12') }
  its(:stdout) { should_not contain('3.5.2') }
end

describe command(command_base % 'python --version') do
  its(:stdout) { should contain('2.7.12') }
  its(:stdout) { should_not contain('3.5.2') }
end

# Check whether variables of 'FGtatsuro.anyenv' affects the behavior of this role properly.
describe file("#{ENV['ANYENV_HOME']}/.anyenv/envs/pyenv/bin/pyenv") do
  it { should exist }
end
