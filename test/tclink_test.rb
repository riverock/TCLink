require 'test/unit'

class TCLinkTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    require_relative '../ext/tclink'
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_send
    params = {}
    params["custid"] = "TestMerchant"
    params["password"] = "password"
    params["action"] = "sale"
    params["media"] = "cc"
    params["cc"] = "4111111111111111"
    params["exp"] = "0110"
    params["amount"] = "100"
    params["name"] = "Joe Ruby"

# Send the hash to TrustCommerce for processing
    result = TCLink.send(params)
    assert('approved').equal?(result['status'])

    # fail('Not implemented')
  end
end