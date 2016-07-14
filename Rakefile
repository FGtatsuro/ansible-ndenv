require 'rake'
require 'rspec/core/rake_task'

task :spec    => 'spec:all'
task :default => :spec

namespace :spec do
  hosts = [
    {
      :name     =>  'localhost',
      :backend  =>  'exec',
      :anyenv_owner => 'travis',
      :anyenv_home  => '/Users/travis'
    },
    {
      :name     =>  'container',
      :backend  =>  'docker',
      :anyenv_owner => 'root',
      :anyenv_home  => '/root'
    },
    {
      :name     =>  'container_with_specified_user',
      :backend  =>  'docker',
      :anyenv_owner => 'jenkins',
      :anyenv_home  => '/home/jenkins'
    }
  ]
  if ENV['SPEC_TARGET'] then
    target = hosts.select{|h|  h[:name] == ENV['SPEC_TARGET']}
    hosts = target unless target.empty?
  end

  task :all     => hosts.map{|h|  "spec:#{h[:name]}"}
  task :default => :all

  hosts.each do |host|
    desc "Run serverspec tests to #{host[:name]}(backend=#{host[:backend]})"
    RSpec::Core::RakeTask.new(host[:name].to_sym) do |t|
      ENV['TARGET_HOST'] = host[:name]
      ENV['SPEC_TARGET_BACKEND'] = host[:backend]
      ENV['ANYENV_OWNER'] = host[:anyenv_owner]
      ENV['ANYENV_HOME'] = host[:anyenv_home]
      t.pattern = "spec/ndenv_spec.rb"
    end
  end
end
