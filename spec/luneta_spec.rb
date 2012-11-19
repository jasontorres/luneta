require 'spec_helper'
include Rack::Test::Methods

describe 'Luneta' do

  def app
    routes = [
      {
        title: 'Simple HAML',
        path: '/simple-test.html',
        template: 'spec/sample-site/simple-test.erb',
        layout: 'spec/sample-site/layout.erb',
        locals: {title: 'Simple Test', description: 'Simple Description'}
      },
      {
        title: 'Simple ERB',
        path: '/test.html',
        template: 'spec/sample-site/index.html.erb',
        layout: 'spec/sample-site/layout.erb',
        locals: {title: 'Test', description: 'SEO description'}
      }
    ]

    Luneta::Park.start(routes) do

    end
  end

  it "returns the instance" do
    app.must_be_instance_of(Luneta::Builder)
  end

  it "returns a valid page" do
    request "/test.html"
    #last_response.must_be :ok?
    last_response.ok?.must_equal(true)
  end


end
