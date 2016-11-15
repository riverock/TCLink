require 'rubygems' unless defined?(Gem)

spec=Gem::Specification.new do |s|
  s.name = 'tclink'
#note: extconf takes version out of this file
  s.version = '4.2.2'
  s.summary = "TCLink Trust Commerce link"
  s.description = "Trust Commerce connectivity layer"
  s.homepage = "https://github.com/peejaybee/TCLink"
  s.license = "LGPL-2.1"
  s.require_path = 'ext'
  s.required_ruby_version = '>=1.8.7'
  # s.has_rdoc = false
  s.author = "Josh Puetz"
  s.email = "developer@trustcommerce.com"
  s.extensions = ["ext/extconf.rb"]

  s.files = Dir['ext/*.c'] + Dir['ext/*.h'] + Dir['ext/extconf.rb'] + %w[
    LICENSE README doc/TCDevGuide.html doc/TCDevGuide.txt
    test/tclink_test.rb
    Rakefile
    tclink.gemspec]
  s.files
end

if $0 == __FILE__
  #Gem::manage_gems
  #Gem::Builder.new(spec).build
  require 'rubygems/gem_runner'
  Gem::GemRunner.new.run ['build', 'tclink.gemspec']
end

spec