require 'changelog/utils'
require 'changelog/engine' if defined?(Rails)
require 'pivotal-tracker' if Changelog::Utils.gem_available?('pivotal-tracker')