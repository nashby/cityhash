require 'mkmf'

have_library('objc') if RUBY_PLATFORM =~ /darwin/

%w{g O3 Wall rdynamic}.each do |flag|
  flag = "-#{flag}"
  $CPPFLAGS += " #{flag}" unless $CPPFLAGS.split.include? flag
end

CONFIG['LDSHARED'] = '$(CXX) -shared' unless RUBY_PLATFORM =~ /darwin/

create_makefile('cityhash')
