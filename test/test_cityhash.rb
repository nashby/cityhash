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

  should "return 128bit hash" do
    assert_equal 130554790001792308794529643941127319555, CityHash.hash128("test")
  end

  should "return 128bit hash with seed" do
    assert_equal 183946415266487905135364192266033899899, CityHash.hash128("test", [123,123])
  end

end
