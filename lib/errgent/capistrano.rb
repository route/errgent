if defined?(Capistrano::VERSION)
  if Gem::Version.new(Capistrano::VERSION).release >= Gem::Version.new('3.0.0')
    version = 3
  end
end

version ||= 2
require_relative "capistrano/v#{version}"
