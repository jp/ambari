#!/usr/bin/env rake

require 'bundler/setup'

# creates metadata.json
desc 'Create metadata.json from metadata.rb'
task :metadata do
  sh 'knife cookbook metadata from file metadata.rb'
end

# share cookbook to Chef community site
desc 'Share cookbook to community site'
task :share do
  sh 'knife cookbook site share ambari other'
end

# default tasks are quick, commit tests
task :default => %w(metadata)
