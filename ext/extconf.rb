#
# create the make file and all necessary files to compile
#

#NOTE: this must be run from the ext directory

require 'mkmf'

File.delete 'config.h' if File.exist? 'config.h'

ssldir = (`openssl version -d`.chomp.split(/:/)[1]).gsub(' ', '').gsub(/"/, '')
certdir = "#{ssldir}/certs"
certpath = nil

filenames = %w(ca-bundle.crt ca-certificates.crt ca-bundle.trust.crt tls-ca-bundle.pem cert.pem)
dirs = [ssldir, certdir]

filenames.each do |name|
  dirs.each do |dir|
    path = "#{dir}/#{name}"
    if File.exist?(path) & certpath.nil?
      certpath = path
    end
  end
end

# determine the platform name
uname=`uname -sm | tr ' ' -`.chomp

# determine ruby version (just read out of the gemspec file)
# it will have a line that reads s.version = '3.4.4'
#   find the lines (grep)
#   select the first
#   cut up on quote (split)
#   and pick the part that is in the quotes [1]

version =''
File.open("../tclink.gemspec", "r") { |f|
  version = f.read.lines.grep(/s\.version/).first.split(/['"]/)[1]
}

#must at least have 3 digits in version string (e.g. "3.4")
raise "could not determine version from spec file" unless version && version.size > 2

# config.h file sets TCLINK_VERSION with approperiate environment information
File.open("config.h", "w") do |f|
  f.puts "#define TCLINK_VERSION \"#{version}-Ruby-#{uname}\""
  f.puts "#define TCLINK_CA_PATH \"#{certpath}\""
end

have_library("crypto", "CRYPTO_lock")
have_library("ssl", "SSL_connect")
create_makefile("tclink")
