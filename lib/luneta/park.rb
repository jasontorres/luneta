# Luneta::Park
# A rack handler to support development or running as a standalone server

require 'rack/request'
require 'rack/response'

module Luneta
  class Park

    class << self

      @@routes = []

      def start(routes = [], &block)

        builder = Luneta::Builder.new do |builder| 
          builder.run Luneta::Park.new(routes)
        end
        
        yield block

        return builder

      end

      def path(&block)
        yield block
      end

    end

    def initialize(routes) 
      @routes = routes
    end

    def call(env)

      @output = ""

      @routes.each do |route|
	      match = env['PATH_INFO'].match(route[:path])
	      if match
          req = Rack::Request.new(env)
          template = route[:template]
          template = Dir.pwd + "/" + template
          layout_template = route[:layout]
          layout_template = Dir.pwd + "/" + layout_template

          res = Rack::Response.new

          if layout_template

            layout = Luneta::Template.new(layout_template)

            @output = layout.render(route[:title], route[:locals]) do
              Luneta::Template.new(template).render(route[:title], route[:locals])
            end

          else
            @output = Luneta::Template.new(template).render(route[:title], route[:locals])
          end

          res.write @output
          res.finish

          return res
	      end
	    end

    end

  end
end
