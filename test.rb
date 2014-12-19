require 'minitest/autorun'
require_relative 'skript.rb'

class LogFinderTest < Minitest::Test

  # def test_returns_array
  #   result = LogFinder.run('fixtures')
  #   assert_equal(Array, result.class)
  # end

  def test_list_files
    list = [
      {name: 'fixtures/brody.txt', size: 4}, 
      {name: 'fixtures/carrie.txt', size: 0}, 
      {name: 'fixtures/quinn.txt', size: 0}
    ]
    result = LogFinder.run('fixtures')
    assert_equal(list, result)
  end

end