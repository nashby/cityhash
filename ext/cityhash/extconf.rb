require 'mkmf'

cxx = ENV['CXX'] || with_config('CXX')
RbConfig::MAKEFILE_CONFIG['CXX'] = cxx if cxx

%w{g O3 Wall}.each do |flag|
  flag = "-#{flag}"
  $CPPFLAGS += " #{flag}" unless $CPPFLAGS.split.include? flag
end

$CPPFLAGS += " -std=c++11"

create_makefile('cityhash/cityhash')
