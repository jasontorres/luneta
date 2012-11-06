class Luneta::Template 

  @template = nil

  def initialize(file, options = {})
    @template = Tilt.new(file)
  end

  def render(scope=Object.new, locals={}, &block)
    @template.render(scope, locals, &block)
  end

end
