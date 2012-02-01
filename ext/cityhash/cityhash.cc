#include <ruby.h>
#include "city.h"

// Use this typedef to make the compiler happy when
// calling rb_define_method()
typedef VALUE (ruby_method)(...);

extern "C" VALUE cityhash_hash64(VALUE mod, VALUE input)
{
  return ULL2NUM(CityHash64(StringValuePtr(input), RSTRING_LEN(input)));
}

extern "C" VALUE cityhash_hash64_with_seed(VALUE mod, VALUE input, VALUE seed)
{
  return ULL2NUM(CityHash64WithSeed(StringValuePtr(input), RSTRING_LEN(input), NUM2ULL(seed)));
}

extern "C" VALUE cityhash_hash64_with_seeds(VALUE mod, VALUE input, VALUE seed1, VALUE seed2)
{
  return ULL2NUM(CityHash64WithSeeds(StringValuePtr(input), RSTRING_LEN(input), NUM2ULL(seed1), NUM2ULL(seed2)));
}

extern "C" VALUE cityhash_hash128(VALUE mod, VALUE input)
{
  uint128 hash = CityHash128(StringValuePtr(input), RSTRING_LEN(input));
  return rb_str_new((char *)&hash, sizeof(hash));
}

extern "C" VALUE cityhash_hash128_with_seed(VALUE mod, VALUE input, VALUE seed_string)
{
  uint128 seed = *(uint128 *)StringValuePtr(seed_string);
  uint128 hash = CityHash128WithSeed(StringValuePtr(input), RSTRING_LEN(input), seed);
  return rb_str_new((char *)&hash, sizeof(hash));
}

extern "C" void Init_cityhash()
{
  VALUE mCityHash = rb_define_module("CityHash");
  VALUE mInternal = rb_define_module_under(mCityHash, "Internal");

  rb_define_singleton_method(mInternal, "hash64", (ruby_method*) &cityhash_hash64, 1);
  rb_define_singleton_method(mInternal, "hash64_with_seed", (ruby_method*) &cityhash_hash64_with_seed, 2);
  rb_define_singleton_method(mInternal, "hash64_with_seeds",  (ruby_method*) &cityhash_hash64_with_seeds, 3);

  rb_define_singleton_method(mInternal, "hash128", (ruby_method*) &cityhash_hash128, 1);
  rb_define_singleton_method(mInternal, "hash128_with_seed", (ruby_method*) &cityhash_hash128_with_seed, 2);
}
