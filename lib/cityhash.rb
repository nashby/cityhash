require 'ffi'

module CityHash
  extend FFI::Library
  
  ffi_lib "lib/cityhash/ext/libcity.so"
  attach_function :city_hash64, :CityHash64, [:string, :size_t], :uint64
  attach_function :city_hash64_with_seed, :CityHash64WithSeed, [:string, :size_t, :uint64], :uint64
  attach_function :city_hash64_with_seeds, :CityHash64WithSeeds, [:string, :size_t, :uint64, :uint64], :uint64
  attach_function :city_hash128, :CityHash128, [:string, :size_t], :ulong
  attach_function :city_hash128_with_seed, :CityHash128WithSeed, [:string, :size_t, :ulong], :ulong
end
