#include "city_ruby_bridge.h"
#include <sstream>

const char* CityHash128String(const char *s, size_t len)
{
  std::ostringstream str;
  str << Uint128Low64(CityHash128(s, len)) << Uint128High64(CityHash128(s, len));

  return str.str().c_str();
}

const char* CityHash128WithSeedString(const char *s, size_t len, uint64 seed1, uint64 seed2)
{
  uint128 seed(seed1, seed2);
  std::ostringstream str;
  str << Uint128Low64(CityHash128WithSeed(s, len, seed)) << Uint128High64(CityHash128WithSeed(s, len, seed));

  return str.str().c_str();
}
