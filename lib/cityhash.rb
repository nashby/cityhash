require 'cityhash/version'
require 'cityhash/cityhash'

module CityHash
  LOW64_MASK  = 0x0000000000000000ffffffffffffffff
  HIGH64_MASK = 0xffffffffffffffff0000000000000000

  def self.hash32(input)
    input = input.to_s

    Internal.hash32(input)
  end

  def self.hash64(input, seed1=nil, seed2=nil)
    input = input.to_s

    return Internal.hash64(input) if seed1.nil?
    return Internal.hash64_with_seed(input, seed1.to_i) if seed2.nil?
    Internal.hash64_with_seeds(input, seed1.to_i, seed2.to_i)
  end

  def self.hash128(input, seed=nil)
    input = input.to_s

    digest = if seed
      Internal.hash128_with_seed(input, packed_seed(seed))
    else
      Internal.hash128(input)
    end

    unpacked_digest(digest)
  end

  if Internal.respond_to?(:hash128crc)
    def self.hash128crc(input, seed=nil)
      input = input.to_s

      digest = if seed
        Internal.hash128crc_with_seed(input, packed_seed(seed))
      else
        Internal.hash128crc(input)
      end

      unpacked_digest(digest)
    end
  end

  if Internal.respond_to?(:hash256crc)
    def self.hash256crc(input)
      input = input.to_s
      digest = Internal.hash256crc(input)

      [0..7, 8..15, 16..23].map { |r| digest[r].unpack('Q').first.to_s }.join.to_i
    end
  end

  private

  def self.packed_seed(seed)
    [seed & LOW64_MASK, seed & HIGH64_MASK >> 64].pack('QQ')
  end

  def self.unpacked_digest(digest)
    [0..7, 8..15].map { |r| digest[r].unpack('Q').first.to_s }.join.to_i
  end
end
