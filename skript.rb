require "pathname"
require "pry"
require "awesome_print"
require_relative 'log_file.rb'

class LogFinder

  def initialize(path)
    @path = path
  end

  def find(path)
    old_path = Pathname.getwd
    Dir.chdir(@path) #change into folder

    pathnames = Pathname.glob('**/*.log') #oder path mit string interpolation übergebn, List of Pathname Objects

    logfiles = convert(pathnames)

    @sorted_result = order(logfiles)


    Dir.chdir(old_path)

    @sorted_result
  end

  def delete
    index = LogFinder.get_input.to_i
    @path_as_string = (@sorted_result[index])[:name]
    puts "Are you sure you want to delete #{@path_as_string}? Confirm with Y"
    answer =  LogFinder.get_input
    Pathname.new(@path_as_string).delete if answer == 'Y'
  end

  def self.get_input
    input = STDIN.gets.chomp # nur gets.chomp (ie Kernel#gets, reads from pathnames given as argument) geht nicht, stattdessen IO#gets (reads from directory name)
    if input.downcase == "exit"
      raise "ApplicationWantsToExit"
    end
    return input
  end

  private

  def convert(pathnames)
    pathnames.map do |p|
      LogFile.new(p)
    end
  end

  def order(result)
    (result.sort_by {|logfile| logfile.size}).reverse
  end
end