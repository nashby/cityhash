require 'helper'

class TestCityhash < Test::Unit::TestCase

  should "return 64bit hash" do
    assert_equal 17703940110308125106, CityHash.hash64("test")
  end

  should "return 64bit hash with a seed" do
    assert_equal 14900027982776226655, CityHash.hash64("test", 12345)
  end

  should "return 64bit hash with seeds" do
    assert_equal 11136353178704814373, CityHash.hash64("test", 12345, 54321)
  end

end
