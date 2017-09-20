### cityhash [![TravisCI](https://secure.travis-ci.org/nashby/cityhash.png?branch=master)](http://travis-ci.org/nashby/cityhash)

Ruby wrapper for google's cityhash.

### Install

    gem install cityhash

### Usage

```ruby
require 'cityhash'

text = "test"
seed1 = 12345
seed2 = 54321

CityHash.hash32(text)               # => 1633095781
CityHash.hash64(text)               # => 8581389452482819506
CityHash.hash64(text, seed1)        # => 9154302171269876511
CityHash.hash64(text, seed1, seed2) # => 4854399283587686019
CityHash.hash128(text)              # => 124124989950401219618153994964897029896
CityHash.hash128(text, seed1)       # => 101668641288246442316643001405184598611
CityHash.hash128crc(text)           # => 124124989950401219618153994964897029896
CityHash.hash128crc(text, seed1)    # => 101668641288246442316643001405184598611
CityHash.hash256crc(text)           # => 11964743055457135893972873789222488394617411264226841264756
```

### Important note

CityHash does not maintain backward compatibility with previous versions. You should not use CityHash for persitent storage, or else never upgrade it. 

If you need backward compatibility please consider other hash functions like [xxHash](https://github.com/nashby/xxhash) or [MurmurHash](https://github.com/ksss/digest-murmurhash)

### Contributing to cityhash

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

### Authors

#### [Contributors](http://github.com/nashby/cityhash/contributors)
 - [Johannes Holzfuß](http://github.com/DataWraith)
 - [Quin Hoxie](https://github.com/qhoxie)
 - [David Dai](https://github.com/newtonapple)
 - [Sergey Nartimov](https://github.com/lest)

[Vasiliy Ermolovich](http://github.com/nashby/)<br/>

### Copyright

Copyright (c) 2012 Vasiliy Ermolovich. See LICENSE.txt for
further details.
