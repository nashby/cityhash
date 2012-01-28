require 'test_helper'

describe CityHash do
  it 'returns 64bit hash' do
    assert_equal 17703940110308125106, CityHash.hash64("test")
  end

  it "returns 64bit hash with a seed" do
    assert_equal 14900027982776226655, CityHash.hash64("test", 12345)
  end

  it "returns 64bit hash with seeds" do
    assert_equal 11136353178704814373, CityHash.hash64("test", 12345, 54321)
  end

  it "returns 128bit hash" do
    assert_equal 1800071687761605184910580728449884026697, CityHash.hash128("test")
  end

  it "returns 128bit hash with seed" do
    seed = (123 << 64) | 123
    assert_equal 1631427474705635869517741677842296176559, CityHash.hash128("test", seed)
  end
end
