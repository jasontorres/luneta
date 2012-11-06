require 'minitest/spec'
require 'minitest/autorun'

require 'luneta'

def sample_file(filename)
  test_root = File.expand_path(File.dirname(__FILE__))
  File.join(test_root, filename)
end
