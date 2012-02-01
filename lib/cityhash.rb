require 'cityhash/version'
require 'cityhash/cityhash'

module CityHash
  LOW64_MASK  = 0x0000000000000000ffffffffffffffff
  HIGH64_MASK = 0xffffffffffffffff0000000000000000

  def self.hash64(input, seed1=nil, seed2=nil)
    return Internal.hash64(input) if seed1.nil?
    return Internal.hash64_with_seed(input, seed1.to_i) if seed2.nil?
    Internal.hash64_with_seeds(input, seed1.to_i, seed2.to_i)
  end

  def self.hash128(input, seed=nil)
    if seed
      seed = [seed & LOW64_MASK, seed & HIGH64_MASK >> 64].pack('QQ')
      digest = Internal.hash128_with_seed(input, seed)
    else
      digest = Internal.hash128(input)
    end
    [0..7, 8..15].map { |r| digest[r].unpack('Q').first.to_s }.join.to_i
  end
end
