require "bundler/gem_tasks"

require 'rake/testtask'
require 'rake/clean'

NAME = 'cityhash'

file "lib/#{NAME}/#{NAME}.so" => Dir.glob("ext/#{NAME}") do
  Dir.chdir("ext/#{NAME}") do
    ruby "extconf.rb"
    sh "make"
  end
  cp "ext/#{NAME}/#{NAME}.so", "lib/#{NAME}"
end

task :test => "lib/#{NAME}/#{NAME}.so"

CLEAN.include('ext/**/*{.o,.log,.so}')
CLEAN.include('ext/**/Makefile')
CLOBBER.include('lib/**/*.so')

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'test/*_test.rb'
  t.verbose = true
end

desc "Run tests"
task :default => :test
