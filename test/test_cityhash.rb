require 'helper'

class TestCityhash < Test::Unit::TestCase
  should "return 64bit hash" do
    assert_equal 17703940110308125106, CityHash.city_hash64("test", 4)
  end
  
  should "return 64bit hash with a seed" do
    assert_equal 14900027982776226655, CityHash.city_hash64_with_seed("test", 4, 12345)
  end  
  
  should "return 64bit hash with seeds" do
    assert_equal 11136353178704814373, CityHash.city_hash64_with_seeds("test", 4, 12345, 54321)
  end   
  
end
