class Luneta::Builder < Rack::Builder 

  def initialize(&block)

    super do
      use Rack::Static, :urls => ["/stylesheets", "/javascripts", "/images"] 
      yield self
    end

  end
end
