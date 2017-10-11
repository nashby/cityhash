require 'test_helper'

describe CityHash do
  it 'returns 32bit hash' do
    assert_equal 1633095781, CityHash.hash32("test")
  end

  it 'returns 64bit hash' do
    assert_equal 8581389452482819506, CityHash.hash64("test")
  end

  it 'returns 64bit hash with a seed' do
    assert_equal 9154302171269876511, CityHash.hash64("test", 12345)
  end

  it 'returns 64bit hash with seeds' do
    assert_equal 4854399283587686019, CityHash.hash64("test", 12345, 54321)
  end

  it 'returns 128bit hash' do
    assert_equal 124124989950401219618153994964897029896, CityHash.hash128("test")
  end

  it 'returns 128bit hash with seed' do
    seed = (123 << 64) | 123
    assert_equal 1834994000056895780313918994795281207519, CityHash.hash128("test", seed)
  end

  it 'returns 128bit crc hash' do
    skip unless CityHash.respond_to?(:hash128crc)

    assert_equal 124124989950401219618153994964897029896, CityHash.hash128crc("test")
  end

  it 'returns 128bit crc hash with seed' do
    skip unless CityHash.respond_to?(:hash128crc)

    seed = (123 << 64) | 123
    assert_equal 1834994000056895780313918994795281207519, CityHash.hash128crc("test", seed)
  end

  it 'returns 256bit crc hash' do
    skip unless CityHash.respond_to?(:hash256crc)

    assert_equal 11964743055457135893972873789222488394617411264226841264756, CityHash.hash256crc("test")
  end

  it 'converts input data to string' do
    assert_equal CityHash.hash128('1337'), CityHash.hash128(1337)
  end

  it 'does not core when you pass it nil' do
    assert_raises TypeError do
      CityHash::Internal.hash64(nil)
    end

    CityHash.hash64(nil)
  end
end
