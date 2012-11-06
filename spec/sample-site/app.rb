#$:.unshift File.expand_path(File.dirname(__FILE__) + "/../../lib")

require 'luneta'

builder = Rack::Builder.new do

  use Rack::Static, :urls => ["/stylesheets", "/javascripts", "/images"] 

  run Luneta::Park.new([
    {
      title: 'Simple HAML',
      path: '/simple-test.html',
      template: 'simple-test.erb',
      layout: 'layout.erb',
      locals: {title: 'Simple Test', description: 'Simple Description'}
    },
    {
      title: 'Simple ERB',
      path: '/test.html',
      template: 'index.html.erb',
      layout: 'layout.erb',
      locals: {title: 'Test', description: 'SEO description'}
    }
  ])

end

#Luneta.new do

  #path '/simple-test.haml' do
    #title 'Simple Haml'
    #template 'simple-test.erb'
  #end

#end

App = builder
