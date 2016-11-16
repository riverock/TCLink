Some countries have regulations on the use of cryptographic libraries
like the ones embedded in TCLink. It may be unlawful to download TCLink
in these countries.


                                TCLink v4.2.0
                            Ruby Implementation
                       copyright (C) TrustCommerce 2010
                         http://www.trustcommerce.com
                         techsupport@trustcommerce.com

                               June 1, 2016

# Description

  TCLink is a thin client library to allow your e-commerce servers to
connect to the TrustCommerce payment gateway easily and consistently.
The protocol (which is the same across all platforms and languages) is
well-documented in the Web Developer's Guide, so please consult it for
any questions you may have about the protocol syntax itself.


## License

  TCLink for Ruby is released under the GNU LGPL.  Please read LICENSE
for details.


## Requirements

  You need to have the OpenSSL development libraries installed. (Note that OS X El Capitan and later do not ship with these libraries.) It
is recommended that you use the latest version provided by the vendor
for PCI reasons.

  Besides the normal Ruby install, you'll need the ruby-devel package,
which contains files needed for building Ruby extensions.

## Installation

  ```[sudo] gem install tclink```

### OS X El Capitan and Later

  If you have difficulty on OS X El Capitan or later, you may need to
  - Install OpenSSL through Homebrew (see https://solitum.net/openssl-os-x-el-capitan-and-brew/)
  - Link to the OpenSSL libraries (see https://solitum.net/openssl-os-x-el-capitan-and-brew/)
    ```
    $ cd /usr/local/include
    $ ln -s ../opt/openssl/include/openssl .
    ```
  - Set SSL_CERT_PATH to point to a valid SSL certificate at install time (You may need to export the certs from the OS X keystore. openssl-osx-ca makes this easy and is available on homebrew):
  ```SSL_CERT_PATH=/usr/local/etc/openssl/cert.pem gem install tclink```


## Testing

```rake test```

  This script will run a test transaction and print the results.

## Usage

  The tctest.rb script shows a simple example of running transactions
through the TCLink API.  For further information, please consult the TC
Developer's Guide, located in the doc subdirectory.

## NOTE

I forked this from a fork of the original repository whose creator writes:

"I packaged this up as a gem for my own uses. I am not affiliated with
Trust Commerce and have not modified any of the C code.

If you have trouble building this, you can download a tarball of the source
from Trust Commerce's vault.
"

--Phillip Birmingham
phillip.birmingham@fidelitylife.com
