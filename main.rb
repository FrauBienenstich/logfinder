#!/usr/bin/env ruby
#Will interpret your $PATH, and find ruby in any directory in your $PATH.
require_relative 'log_file.rb'
require_relative 'skript.rb'
require 'colorize'

path = ARGV[0]

@log_finder = LogFinder.new(path)

@wants_to_exit = false
@do_not_delete = false

while not @wants_to_exit 
  begin
    @errors = []
    puts "This is a list of your log files, ordered by size. Please type in the number of the one you want to delete."
    result = @log_finder.find(path)
    result.each {|result| puts "FILE: #{result.name}, SIZE: #{result.human_size}" } #colorize gem
    @log_finder.delete

  rescue SystemExit, Interrupt
    @wants_to_exit = true
    @do_not_delete = true
  rescue Exception => e
    puts e.to_s
    @wants_to_exit = true
  end
end