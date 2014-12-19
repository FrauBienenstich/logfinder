require "pathname"

class LogFinder

  def self.run(path)
    old_path = Dir.pwd
    Dir.chdir(path) #change into folder
    new_path = Dir.pwd # show absolute path

    abs_path = Pathname(new_path)
    files = abs_path.children

    result = files.map { |file|
      {
         name: File.absolute_path(file.basename),
         size: file.size
       }
    }

    Dir.chdir(old_path)
    result
  end

end