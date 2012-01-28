require 'ffi'
require 'cityhash/version'

module CityHash

  LOW64_MASK  = 0x0000000000000000ffffffffffffffff
  HIGH64_MASK = 0xffffffffffffffff0000000000000000

  module Internal
    extend FFI::Library

    ffi_lib(
      case RUBY_PLATFORM
        when /darwin/
          File.join(File.dirname(__FILE__), '..', 'ext', 'cityhash', 'cityhash.bundle')
        when /mingw|mswin|linux/
          File.join(File.dirname(__FILE__), '..', 'ext', 'cityhash', 'cityhash.so')
        else
          File.join(File.dirname(__FILE__), '..', 'ext', 'cityhash', "cityhash.#{RbConfig::CONFIG['DLEXT']}")
      end
    )

    attach_function :city_hash64, :CityHash64, [:string, :size_t], :uint64
    attach_function :city_hash64_with_seed, :CityHash64WithSeed, [:string, :size_t, :uint64], :uint64
    attach_function :city_hash64_with_seeds, :CityHash64WithSeeds, [:string, :size_t, :uint64, :uint64], :uint64
    attach_function :city_hash128, :CityHash128String, [:string, :size_t], :string
    attach_function :city_hash128_with_seed, :CityHash128WithSeedString, [:string, :size_t, :uint64, :uint64], :string
  end

  def self.hash64(input, seed1 = nil, seed2 = nil)
    input_str = input.to_s

    # Ruby 1.8 compatibility
    if input_str.respond_to?(:bytesize)
      len = input_str.bytesize
    else
      len = input_str.size
    end

    return CityHash::Internal.city_hash64(input_str, len) if seed1.nil?
    return CityHash::Internal.city_hash64_with_seed(input_str, len, seed1.to_i & LOW64_MASK) if seed2.nil?

    CityHash::Internal.city_hash64_with_seeds(input_str, len, seed1.to_i & LOW64_MASK, seed2.to_i & LOW64_MASK)
  end

  def self.hash128(input, seed = nil)
    input_str = input.to_s

    # Ruby 1.8 compatibility
    if input_str.respond_to?(:bytesize)
      len = input_str.bytesize
    else
      len = input_str.size
    end

    return CityHash::Internal.city_hash128(input_str, len).to_i if seed.nil?

    seed_low  =  seed.to_i & LOW64_MASK
    seed_high = (seed.to_i & HIGH64_MASK) >> 64

    CityHash::Internal.city_hash128_with_seed(input_str, len, seed_low, seed_high).to_i
  end
end
