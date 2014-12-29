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
      {name: "#{pwd}/fixtures/haqqani.log", size: 106},
      {name: "#{pwd}/fixtures/saul.log", size: 23}
    ]
    result = LogFinder.run('fixtures')
    assert_equal(list, result)
  end

  def test_list_only_log_files
    pwd = Pathname.getwd
    list = [
      {name: "#{pwd}/fixtures/haqqani.log", size: 106},
      {name: "#{pwd}/fixtures/saul.log", size: 23}
    ]

    result = LogFinder.run('fixtures')
    assert_equal(list, result)
  end

  def test_do_not_list_other_files
    pwd = Pathname.getwd
    full_list = [
      {name: "#{pwd}/fixtures/haqqani.log", size: 106}, 
      {name: "#{pwd}/fixtures/carrie.txt", size: 50}, 
      {name: "#{pwd}/fixtures/quinn.txt", size: 24}, 
      {name: "#{pwd}/fixtures/saul.log", size: 23}, 
      {name: "#{pwd}/fixtures/brody.txt", size: 11}
    ]
    result = LogFinder.run('fixtures')
    refute_equal(full_list, result)

  end

end