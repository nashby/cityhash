require 'test_helper'

describe CityHash do
  it 'returns 32bit hash' do
    assert_equal 1633095781, CityHash.hash32("test")
  end

  it 'returns 64bit hash' do
    assert_equal 8581389452482819506, CityHash.hash64("test")
  end

  it "returns 64bit hash with a seed" do
    assert_equal 9154302171269876511, CityHash.hash64("test", 12345)
  end

  it "returns 64bit hash with seeds" do
    assert_equal 4854399283587686019, CityHash.hash64("test", 12345, 54321)
  end

  it "returns 128bit hash" do
    assert_equal 124124989950401219618153994964897029896, CityHash.hash128("test")
  end

  it "returns 128bit hash with seed" do
    seed = (123 << 64) | 123
    assert_equal 1834994000056895780313918994795281207519, CityHash.hash128("test", seed)
  end
end
