require "pathname"
require "pry"

class LogFinder

  def self.run(path)
    old_path = Pathname.getwd
    Dir.chdir(path) #change into folder
    new_path = Pathname.getwd

    files = new_path.children

    result = files.map do |file|
      {
         name: Pathname.new(file.basename).realpath.to_s,
         size: file.size
       }
    end
    result = (result.sort_by {|k| k[:size]}).reverse

    Dir.chdir(old_path) #change back into old folder
    result
  end

end