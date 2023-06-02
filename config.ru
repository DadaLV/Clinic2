# This file is used by Rack-based servers to start the application.

require_relative "config/environment"


run do |env|
  [200, {}, ["Hello World"]]
end