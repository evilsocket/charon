require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.warning = true
  test.verbose = true
end

task :default => :test

require 'rake/clean'
CLEAN.include "**/*.rbc"
CLEAN.include "**/.DS_Store"
