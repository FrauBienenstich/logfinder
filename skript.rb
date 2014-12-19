require "pathname"

class LogFinder

  def self.run(path)
    old_path = Pathname.getwd
    Dir.chdir(path) #change into folder
    new_path = Pathname.getwd

    abs_path = Pathname(new_path)
    files = abs_path.children

    result = files.map do |file|
      {
         name: File.absolute_path(file.basename),
         size: file.size
       }
    end

    Dir.chdir(old_path) #change back into old folder
    result
  end

end