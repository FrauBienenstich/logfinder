require "pathname"
require "pry"

class LogFinder

  #attr_accessor :path

  def initialize(path)
    @path = path
  end

  def self.run(path)
    LogFinder.new(path).find   
  end

  def find
    old_path = Pathname.getwd
    Dir.chdir(@path) #change into folder

    files = Pathname.glob('**/*.log') 

    result = sanitized(files)

    sorted_result = order(result)

    Dir.chdir(old_path) #change back into old folder
    sorted_result
  end

  private

  def sanitized(files)
    files.map do |file|
      {
         name: file.realpath.to_s,
         size: file.size
       }
    end
  end

  def order(result)
    (result.sort_by {|k| k[:size]}).reverse
  end

end