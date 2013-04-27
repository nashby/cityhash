require 'mkmf'

%w{g O3 Wall msse4.2}.each do |flag|
  flag = "-#{flag}"
  $CPPFLAGS += " #{flag}" unless $CPPFLAGS.split.include? flag
end

create_makefile('cityhash/cityhash')
