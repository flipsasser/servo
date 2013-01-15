$LOAD_PATH.push File.dirname(__FILE__)

require 'rubygems'
require 'rack'
require 'servo/directory_index'

module Servo
  class << self
    def app(dir)
      Rack::Builder.new {
        use Servo::DirectoryIndex, dir
        run Rack::Directory.new(dir)
      }
    end
  end
end
