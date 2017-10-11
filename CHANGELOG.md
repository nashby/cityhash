## 0.9.0 (October 11, 2017) ##

### enhancements
  * update cityhash lib version
  * ditch old rubies. support only Ruby 2.0+
  * let the environment dictate the arch
  * do not define CRC methods if it's not supported by system

## 0.8.1 (May 18, 2013) ##

### bugfixes
  * do not segfalt with non-string input
  * use proper compiler flag to compile crc version of cityhash lib (see README about installing gem on OSX,
  on Linux everything should work out of the box)

## 0.8.0 (May 5, 2013) ##

### enhancements
  * add crc methods

## 0.7.0 (October 25, 2012) ##

### enhancements
  * add CityHash.hash32 method
  * update libcityhash to 1.1. See [NEWS](http://code.google.com/p/cityhash/source/browse/trunk/NEWS)
