#include <ruby.h>
#include "city.h"

#ifdef __SSE4_2__
#include "citycrc.h"
#endif

// Use this typedef to make the compiler happy when
// calling rb_define_method()
typedef VALUE (ruby_method)(...);

extern "C" VALUE cityhash_hash32(VALUE mod, VALUE input)
{
  return ULL2NUM(CityHash32(StringValuePtr(input), RSTRING_LEN(input)));
}

extern "C" VALUE cityhash_hash64(VALUE mod, VALUE input)
{
  Check_Type(input, T_STRING);
  return ULL2NUM(CityHash64(StringValuePtr(input), RSTRING_LEN(input)));
}

extern "C" VALUE cityhash_hash64_with_seed(VALUE mod, VALUE input, VALUE seed)
{
  Check_Type(input, T_STRING);
  return ULL2NUM(CityHash64WithSeed(StringValuePtr(input), RSTRING_LEN(input), NUM2ULL(seed)));
}

extern "C" VALUE cityhash_hash64_with_seeds(VALUE mod, VALUE input, VALUE seed1, VALUE seed2)
{
  Check_Type(input, T_STRING);
  return ULL2NUM(CityHash64WithSeeds(StringValuePtr(input), RSTRING_LEN(input), NUM2ULL(seed1), NUM2ULL(seed2)));
}

extern "C" VALUE cityhash_hash128(VALUE mod, VALUE input)
{
  Check_Type(input, T_STRING);
  uint128 hash = CityHash128(StringValuePtr(input), RSTRING_LEN(input));
  return rb_str_new((char *)&hash, sizeof(hash));
}

extern "C" VALUE cityhash_hash128_with_seed(VALUE mod, VALUE input, VALUE seed_string)
{
  Check_Type(input, T_STRING);
  uint128 seed = *(uint128 *)StringValuePtr(seed_string);
  uint128 hash = CityHash128WithSeed(StringValuePtr(input), RSTRING_LEN(input), seed);
  return rb_str_new((char *)&hash, sizeof(hash));
}

#ifdef __SSE4_2__
extern "C" VALUE cityhash_hashcrc128(VALUE mod, VALUE input)
{
  uint128 hash = CityHashCrc128(StringValuePtr(input), RSTRING_LEN(input));
  return rb_str_new((char *)&hash, sizeof(hash));
}

extern "C" VALUE cityhash_hashcrc128_with_seed(VALUE mod, VALUE input, VALUE seed_string)
{
  uint128 seed = *(uint128 *)StringValuePtr(seed_string);
  uint128 hash = CityHashCrc128WithSeed(StringValuePtr(input), RSTRING_LEN(input), seed);
  return rb_str_new((char *)&hash, sizeof(hash));
}

extern "C" VALUE cityhash_hashcrc256(VALUE mod, VALUE input)
{
  uint64 hash[4] = {};
  CityHashCrc256(StringValuePtr(input), RSTRING_LEN(input), hash);
  return rb_str_new((char *)&hash, sizeof(hash));
}
#endif

extern "C" void Init_cityhash()
{
  VALUE mCityHash = rb_define_module("CityHash");
  VALUE mInternal = rb_define_module_under(mCityHash, "Internal");

  rb_define_singleton_method(mInternal, "hash32", (ruby_method*) &cityhash_hash32, 1);

  rb_define_singleton_method(mInternal, "hash64", (ruby_method*) &cityhash_hash64, 1);
  rb_define_singleton_method(mInternal, "hash64_with_seed", (ruby_method*) &cityhash_hash64_with_seed, 2);
  rb_define_singleton_method(mInternal, "hash64_with_seeds",  (ruby_method*) &cityhash_hash64_with_seeds, 3);

  rb_define_singleton_method(mInternal, "hash128", (ruby_method*) &cityhash_hash128, 1);
  rb_define_singleton_method(mInternal, "hash128_with_seed", (ruby_method*) &cityhash_hash128_with_seed, 2);

#ifdef __SSE4_2__
  rb_define_singleton_method(mInternal, "hash128crc", (ruby_method*) &cityhash_hashcrc128, 1);
  rb_define_singleton_method(mInternal, "hash128crc_with_seed", (ruby_method*) &cityhash_hashcrc128_with_seed, 2);

  rb_define_singleton_method(mInternal, "hash256crc", (ruby_method*) &cityhash_hashcrc256, 1);
#endif
}
