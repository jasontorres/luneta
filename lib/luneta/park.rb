# Luneta::Park
# A rack handler to support development or running as a standalone server

require 'rack/request'
require 'rack/response'

module Luneta
  class Park

    def initialize(routes) 
      @routes = routes
    end

    def call(env)
      @output = ""

      @routes.each do |route|
	      match = env['REQUEST_PATH'].match(route[:path])
	      if match
          req = Rack::Request.new(env)
          template = route[:template]
          layout_template = route[:layout]

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
