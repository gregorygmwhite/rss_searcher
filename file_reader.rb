class File_Reader

  URL_REGEX = "((http|ftp|https):\/{2})+([0-9a-z_-]+\.)+[a-z]+"

  def self.get_lines(input)
    if input.is_a? Array
      return input
    else
      return File_Reader.get_lines_from_file(input)
    end
  end

  # assumes file has one line to one url ratio
  def self.get_lines_from_file(filename)
    return null if !filename
    return File.readlines(filename).each_with_object(Array.new) do |line, urls|
      if( line =~ /#{URL_REGEX}/)
        urls.push line.chomp
      end
    end
  end 

end