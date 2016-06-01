require 'bundler/gem_tasks'

task :tag, [:repo] do |_, args|
  args.with_defaults repo: `git config --get remote.origin.url`.strip

  dir_path = Bundler.default_gemfile.dirname
  gemspec_path = Dir["#{dir_path}/*.gemspec"].first
  spec = Bundler.load_gemspec gemspec_path
  version = spec.version
  tag = "v#{version}"

  command = "git tag -m \"Tagging version #{version}\" #{tag}"
  command << ' && '
  command << "git push #{args.repo} #{tag}"

  sh command
end

task :test do
  ruby 'test/tclink_test.rb'
end
