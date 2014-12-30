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
    unordered_list = [
      {name: "#{pwd}/fixtures/haqqani.log", size: 106},
      {name: "#{pwd}/fixtures/smoar/abu_nazir.log", size: 7},
      {name: "#{pwd}/fixtures/saul.log", size: 23},
      {name: "#{pwd}/fixtures/smoar/dana.log", size: 1}
    ]
    result = LogFinder.run('fixtures')
    refute_equal(unordered_list, result)
  end

  def test_do_not_list_non_log_files
    pwd = Pathname.getwd
    text_file  = {name: "#{pwd}/fixtures/carrie.txt", size: 50}
    result = LogFinder.run('fixtures')
    refute_includes(result, text_file) # watch order!
  end

  def test_find_log_files_recursively
    pwd = Pathname.getwd
    all_log_files = [
      {name: "#{pwd}/fixtures/haqqani.log", size: 106},
      {name: "#{pwd}/fixtures/saul.log", size: 23},
      {name: "#{pwd}/fixtures/smoar/abu_nazir.log", size: 7},
      {name: "#{pwd}/fixtures/smoar/dana.log", size: 1}
    ]
    result = LogFinder.run('fixtures')
    assert_equal(all_log_files, result)
  end

end