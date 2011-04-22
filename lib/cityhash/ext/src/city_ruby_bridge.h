#include "city.h"

typedef uint64_t uint64;
typedef std::pair<uint64, uint64> uint128;

extern "C" const char* CityHash128String(const char *s, size_t len);

extern "C" const char* CityHash128WithSeedString(const char *s, size_t len, uint64 seed1, uint64 seed2);
