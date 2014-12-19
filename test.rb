gem "minitest"
require 'minitest/autorun'
require_relative 'skript.rb'

class LogFinderTest < Minitest::Test

  # def test_returns_array
  #   result = LogFinder.run('fixtures')
  #   assert_equal(Array, result.class)
  # end

  def test_list_files
    pwd = Dir.pwd
    list = [
      {name: "#{pwd}/fixtures/brody.txt", size: 10},
      {name: "#{pwd}/fixtures/carrie.txt", size: 49},
      {name: "#{pwd}/fixtures/quinn.txt", size: 23}
    ]
    result = LogFinder.run('fixtures')
    assert_equal(list, result)
  end

end