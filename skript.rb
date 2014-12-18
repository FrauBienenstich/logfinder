class LogFinder


  def self.run(path)
    puts File.size("fixtures/brody.txt")
    puts Dir.pwd
    puts path
    Dir.chdir(path)
    list_of_files = Dir.entries(path)
    # list absolute paths
    list_of_files.map { |file_name| 
      puts File.size(file_name)
      # { 
      #   name: File.basename(file_name),
      #   name: File.size(file_name)
      # }
    }
  end

end


# File.expand_path(File.dirname(__FILE__))
# muss in fixtures rein!!! oder: 