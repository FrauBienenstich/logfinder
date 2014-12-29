gem "minitest"
require 'minitest/autorun'
require_relative 'skript.rb'

class LogFinderTest < Minitest::Test

  def test_returns_array
    result = LogFinder.run('fixtures')
    assert_equal(Array, result.class)
  end

  def test_list_files_sorted_by_size
    pwd = Pathname.getwd
    list = [
      {name: "#{pwd}/fixtures/carrie.txt", size: 50},
      {name: "#{pwd}/fixtures/quinn.txt", size: 24},
      {name: "#{pwd}/fixtures/brody.txt", size: 11}
    ]
    result = LogFinder.run('fixtures')
    assert_equal(list, result)
  end

end