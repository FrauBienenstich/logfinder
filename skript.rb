require "pathname"

class LogFinder

  def self.run(path)
    Dir.chdir(path) #change into folder
    where_i_am = Dir.pwd # show absolute path
    abs_path = Pathname(where_i_am)
    files = abs_path.children

    files.map { |file| 
      { 
         name: "#{path}/" + "#{file.basename.to_s}",
         size: file.size
       }
    }
  end

end