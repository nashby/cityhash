require 'mkmf'

%w{g O3 Wall march=native}.each do |flag|
  flag = "-#{flag}"
  $CPPFLAGS += " #{flag}" unless $CPPFLAGS.split.include? flag
end

create_makefile('cityhash/cityhash')
