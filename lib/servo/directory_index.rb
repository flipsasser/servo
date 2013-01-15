# Thanks to David Stamm (https://github.com/whylom) for this
# middleware that serves an index file if it's exists
module Servo
  class DirectoryIndex
    def initialize(app, dir)
      @app = app
      @dir = dir
    end

    def call(env)
      index_path = ::File.join(@dir, Rack::Request.new(env).path.split('/'), 'index.html')
      if ::File.exists?(index_path)
        return [200, {"Content-Type" => "text/html"}, [::File.read(index_path)]]
      else
        @app.call(env)
      end
    end
  end
end


